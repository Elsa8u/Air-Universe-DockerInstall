#!/bin/sh
echo "
net.ipv6.conf.all.disable_ipv6 = 0
net.ipv6.conf.default.disable_ipv6 = 0
net.ipv6.conf.lo.disable_ipv6 = 0
root@vietnam:~# cat /etc/sysctl.d/
100-optimize.conf  99-sysctl.conf     README.sysctl      
root@vietnam:~# cat /etc/sysctl.d/100-optimize.conf 
fs.file-max = 655360
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_probes = 3
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_orphan_retries = 3
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_retries1 = 5
net.ipv4.tcp_retries2 = 5
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 36000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_reordering = 300
net.ipv4.tcp_retrans_collapse = 0
net.ipv4.tcp_autocorking = 1
net.ipv4.tcp_low_latency = 0
net.ipv4.tcp_slow_start_after_idle = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_no_metrics_save=0
net.ipv4.tcp_tso_win_divisor = 3
net.ipv4.tcp_ecn=1
net.ipv4.tcp_ecn_fallback = 1
net.ipv4.tcp_frto=2
net.ipv4.tcp_mtu_probing=0
net.ipv4.tcp_rfc1337=1
net.ipv4.tcp_sack=1
net.ipv4.tcp_fack=1
net.ipv4.tcp_window_scaling=1
net.ipv4.tcp_adv_win_scale=1
net.ipv4.tcp_moderate_rcvbuf=1
net.ipv4.tcp_rmem=8192 436600 33554432
net.ipv4.tcp_wmem=8192 436600 33554432
net.ipv4.udp_rmem_min=8192
net.ipv4.udp_wmem_min=8192
net.ipv4.tcp_congestion_control=bbr

#  Forward ipv4
#net.ipv4.ip_forward = 1

net.core.somaxconn = 3276800
net.core.netdev_max_backlog = 32768
net.core.netdev_budget = 5000
net.core.rmem_max=33554432
net.core.wmem_max=33554432
net.core.default_qdisc=fq

net.core.netdev_budget = 600
">/etc/sysctl.d/100-optimize.conf 

sysctl -p 
sysctl --system 

echo "优化完成, 请重启系统生效 (OpenVZ/LXC 架构可能效果不佳 建议升级到5.10以上的内核并开启BBR)"
