#!/bin/sh
echo "
vm.swappiness = 10
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
fs.pipe-max-size = 1048576
fs.pipe-user-pages-hard = 0
fs.pipe-user-pages-soft = 0
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter = 0

# socket status
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_timeout = 10
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_keepalive_probes = 3
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 3000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_synack_retries = 2

# tcp window
net.core.wmem_default = 262144
net.core.wmem_max = 67108864
net.core.somaxconn = 3276800
net.core.optmem_max = 81920
net.core.rmem_default = 262144
net.core.rmem_max = 67108864
net.core.netdev_max_backlog = 400000
net.core.netdev_budget = 600
net.ipv4.tcp_max_orphans = 3276800

# forward
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1

# ipv4
net.ipv4.tcp_no_metrics_save=1
net.ipv4.tcp_ecn=0
net.ipv4.tcp_frto=0
net.ipv4.tcp_mtu_probing=0
net.ipv4.tcp_rfc1337=0
net.ipv4.tcp_sack=1
net.ipv4.tcp_fack=1
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_adv_win_scale=1
net.ipv4.tcp_moderate_rcvbuf=1
net.ipv4.tcp_mem = 786432 2097152 3145728 
net.ipv4.tcp_rmem = 4096 524288 67108864
net.ipv4.tcp_wmem = 4096 524288 67108864
net.ipv4.udp_rmem_min=8192
net.ipv4.udp_wmem_min=8192
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr

# netfiliter iptables
net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 30
net.netfilter.nf_conntrack_tcp_timeout_time_wait = 30
net.netfilter.nf_conntrack_tcp_timeout_close_wait = 15
net.netfilter.nf_conntrack_tcp_timeout_established = 350
net.netfilter.nf_conntrack_max = 25000000
net.netfilter.nf_conntrack_buckets = 25000000
net.core.netdev_budget = 600
">/etc/sysctl.conf

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
