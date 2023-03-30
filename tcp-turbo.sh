#!/bin/sh
echo "
net.ipv4.tcp_tw_reuse = 1
fs.inotify.max_user_watches = 1000000
net.ipv4.tcp_max_tw_buckets = 1000000
net.ipv4.tcp_max_syn_backlog=262144
net.core.somaxconn=163840
net.ipv4.tcp_syn_retries=3
net.core.netdev_max_backlog=163840
net.ipv4.tcp_timestamps=1
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_keepalive_intvl = 30
fs.file-max=11000000
fs.nr_open=10000000
net.ipv4.icmp_echo_ignore_all=0
net.ipv4.ip_forward=1
net.ipv4.tcp_moderate_rcvbuf=1
net.ipv4.tcp_fin_timeout=15
net.ipv4.tcp_sack=1
net.ipv4.tcp_retries1=3
net.ipv4.tcp_retries2=5
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_mem=764346        1019129        1528692
net.ipv4.tcp_rmem = 8192 262144 268435456
net.ipv4.tcp_wmem = 4096 16384 268435456
net.ipv4.tcp_adv_win_scale = -2
net.ipv4.tcp_collapse_max_bytes = 6291456
net.ipv4.tcp_notsent_lowat = 131072
net.core.netdev_budget = 600

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
