#default['net.ipv4.conf']['all']['accept_source_route']['parameter']='net.ipv4.conf.all.accept_source_route'
#default['net.ipv4.conf']['all']['accept_source_route']['status']='0'
#default['sysctl']['conf']='/opt/sysctl.conf'


default['sysctl']['network'] = [ { comment:"#3.2.1 Ensure source routed packets are not accepted", 
                                   parameter: "net.ipv4.conf.all.accept_source_route", 
                                   value: "0"
                                   },
                                  { comment: "3.2.2 Ensure ICMP redirects are not accepted",
                                    parameter: "net.ipv4.conf.all.accept_redirects",
                                    value: "0"
                                   },
                                  {  
                                   comment: "3.2.3 Ensure secure ICMP redirects are not accepted ",
                                    parameter: "net.ipv4.conf.all.secure_redirects",
                                    value: "0"

                                   },
  { comment: "# 3.2.3 Addresses Secure ICMP Redirect Acceptance",
    parameter: "enable_net.ipv4.conf.all.secure_redirects",
    value: "0"
  },
  {
  comment: "#3.2.4  Addresses Log Suspicious Packets",
  parameter:"enable_update_net.ipv4.conf.all.log_martians",
  value: "1"
   },
   {
   comment: "#3.2.5 Ensure broadcast ICMP requests are ignored",
   parameter: "enable_net.ipv4.conf.default.log_martians",
   value: "1"
   } 

  ]
