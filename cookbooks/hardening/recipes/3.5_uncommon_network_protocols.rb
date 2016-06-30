# Cookbook Name:: cis-amazonlinux-hardening
# # # # # # Recipe:: UnCommon Network Protocols
# # # # # #saurabh phaltane
# # # # # # Copyright (c) 2016 The Authors, All Rights Reserved.
# # #Control 3.4

#3.5.1 Ensure DCCP is disabled (Not Scored)  
#3.5.2 Ensure SCTP is disabled (Not Scored)  
#3.5.3 Ensure RDS is disabled (Not Scored)  
#3.5.4 Ensure TIPC is disabled (Not Scored)  

['dccp', 'sctp', 'rds','tips'].each do |ntwk_protocol|
     execute "Disable uncommon network protocols  system #{ntwk_protocol}" do
      command "echo 'install #{ntwk_protocol}' /bin/true >> /etc/modprobe.d/CIS.conf"
      not_if "output=$(/usr/bin/grep '#{ntwk_protocol}' /etc/modprobe.d/CIS.conf && echo $?"
    end
end

