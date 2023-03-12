#!/bin/sh
echo "
fs.inotify.max_user_watches = 100000
net.ipv4.tcp_max_tw_buckets = 12000
net.ipv4.tcp_max_syn_backlog=262144
net.core.somaxconn=163840
net.ipv4.tcp_syn_retries=1
net.core.netdev_max_backlog=163840
fs.file-max=11000000
fs.nr_open=10000000
net.ipv4.icmp_echo_ignore_all=0
net.ipv4.ip_forward=1
net.ipv4.tcp_moderate_rcvbuf=1
net.ipv4.tcp_fin_timeout=20
net.ipv4.tcp_sack=1
net.ipv4.tcp_retries1=3
net.ipv4.tcp_retries2=5
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_adv_win_scale=1
net.ipv4.tcp_mem=131072  262144  524288
net.ipv4.tcp_rmem=4096        131072        67108864
net.ipv4.tcp_wmem=4096        87380        67108864

net.ipv4.neigh.default.gc_thresh3=8192
net.ipv4.neigh.default.gc_thresh2=4096
net.ipv4.neigh.default.gc_thresh1=2048
net.ipv6.neigh.default.gc_thresh3=8192
net.ipv6.neigh.default.gc_thresh2=4096
net.ipv6.neigh.default.gc_thresh1=2048

net.ipv4.tcp_slow_start_after_idle = 0
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.core.netdev_budget = 600
net.ipv4.ip_early_demux=0
net.core.dev_weight=1024
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_conntrack_max = 655360
net.ipv4.tcp_no_metrics_save = 0
net.ipv4.tcp_low_latency = 0
net.ipv4.tcp_reordering = 2
net.ipv4.tcp_orphan_retries = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_fack = 1
net.ipv4.route.gc_timeout = 100
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_max_orphans = 32768
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr">/etc/sysctl.conf

echo "* soft nofile 1048576
 DefaultLimitNPROC=1000000
 root hard nofile 1048576
* hard nofile 1048576
* soft nproc 1048576
* hard nproc 1048576
DefaultLimitNOFILE=1000000
* soft core 1048576
* hard core 1048576
* hard memlock unlimited
* soft memlock unlimited
">/etc/security/limits.conf

sysctl -p 
sysctl --system 

echo "优化完成, 请重启系统生效 (OpenVZ/LXC 架构可能效果不佳 建议升级到5.10以上的内核并开启BBR)"
