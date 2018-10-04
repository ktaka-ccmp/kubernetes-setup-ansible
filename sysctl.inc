
  - sysctl: name=net.ipv4.tcp_tw_reuse value="1" sysctl_set=yes
  - sysctl: name=net.core.somaxconn value="8192" sysctl_set=yes
  - sysctl: name=net.core.netdev_max_backlog value="65536" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_slow_start_after_idle value="0" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_autocorking value="0" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_syncookies value="0" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_max_syn_backlog value="65536" sysctl_set=yes

  - sysctl: name=net.core.rmem_max value="8388608" sysctl_set=yes
  - sysctl: name=net.core.wmem_max value="8388608" sysctl_set=yes
  - sysctl: name=net.core.rmem_default value="8388608" sysctl_set=yes
  - sysctl: name=net.core.wmem_default value="8388608" sysctl_set=yes

  - sysctl: name=net.ipv4.tcp_mem value="4096   8388608   8388608" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_rmem value="4096   8388608   8388608" sysctl_set=yes
  - sysctl: name=net.ipv4.tcp_wmem value="4096   8388608   8388608" sysctl_set=yes

  - sysctl: name=net.netfilter.nf_conntrack_max value=20000000 sysctl_set=yes
  - sysctl: name=net.nf_conntrack_max value=20000000 sysctl_set=yes

  - sysctl: name=net.ipv4.tcp_syn_retries value="3" sysctl_set=yes

