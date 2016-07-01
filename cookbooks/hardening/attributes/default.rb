#default['net.ipv4.conf']['all']['accept_source_route']['parameter']='net.ipv4.conf.all.accept_source_route'
#default['net.ipv4.conf']['all']['accept_source_route']['status']='0'
default['sysctl']['conf']='/opt/sysctl.conf'


#3 CIS Network Configuration
default['sysctl']['network'] = [ 
                                      { comment:"#3.2.1 Ensure source routed packets are not accepted",
                                      parameter: "net.ipv4.conf.all.accept_source_route",
                                      value: "0"
                                      },
                                      { comment:"#3.2.1.2 Ensure source routed packets are not accepted(default)",
                                      parameter: "net.ipv4.conf.default.accept_source_route",
                                      value: "0"
                                      },
                                      

                                      { comment: "#3.2.2 Ensure ICMP redirects are not accepted",
                                      parameter: "net.ipv4.conf.all.accept_redirects",
                                      value: "0"
                                      },
                                      { comment: "#3.2.2 Ensure ICMP redirects are not accepted(default)",
                                      parameter: "net.ipv4.conf.default.accept_redirects",
                                      value: "0"
                                      },

                                      {
                                      comment: "#3.2.3 Ensure secure ICMP redirects are not accepted ",
                                      parameter: "net.ipv4.conf.all.secure_redirects",
                                      value: "0"

                                      },
                                       {
                                      comment: "#3.2.3 Ensure secure ICMP redirects are not accepted(default) ",
                                      parameter: "net.ipv4.conf.default.secure_redirects",
                                      value: "0"

                                      },
                                      {
                                      comment: "#3.2.4  Addresses Log Suspicious Packets",
                                      parameter:"net.ipv4.conf.all.log_martians",
                                      value: "1"
                                      },
                                      {
                                      comment: "#3.2.4  Addresses Log Suspicious Packets(default)",
                                      parameter:"net.ipv4.conf.default.log_martians",
                                      value: "1"
                                      },
                                      {
                                      comment: "#3.2.5 Ensure broadcast ICMP requests are ignored",
                                      parameter: "net.ipv4.conf.default.log_martians",
                                      value: "1"
                                      },

                                      {
                                      comment: "#3.2.6 Ensure bogus ICMP responses are ignored ",
                                      parameter: "net.ipv4.icmp_ignore_bogus_error_responses",
                                      value: "1"
                                      },

                                      {
                                      comment: "#3.2.7 Ensure Reverse Path Filtering is enabled ",
                                      parameter: "net.ipv4.conf.all.rp_filter",
                                      value: "1"
                                      },

                                      {
                                      comment: "#3.2.7.2 Ensure Reverse Path Filtering is enabled ",
                                      parameter: "net.ipv4.conf.default.rp_filter",
                                      value: "1"
                                      },
                                      {
                                      comment: "#3.2.8 Ensure TCP SYN Cookies is enabled",
                                      parameter: "net.ipv4.tcp_syncookies",
                                      value: "1"
                                      },

                                      ]




default['audit']['conf']='/etc/audit/auditd.conf'

#4.1 Configure System Accounting (auditd)

default['auditd']['max_log_file']=6
#4.1.1.2 Ensure system is disabled when audit logs are full 
default['auditd']['space_left_action']='email'
default['auditd']['action_mail_acct']='root'
default['auditd']['admin_space_left_action']='halt'
#4.1.1.3 Ensure audit logs are not automatically deleted
default['auditd']['max_log_file_action']='keep_logs'

