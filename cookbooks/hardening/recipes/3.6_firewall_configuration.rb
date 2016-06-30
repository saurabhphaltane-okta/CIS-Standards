# Cookbook Name:: cis-amazonlinux-hardening
# # # # # # Recipe:: FileWall  Configurations
# # # # # #saurabh phaltane
# # # # # # Copyright (c) 2016 The Authors, All Rights Reserved.
# # #Control 3.6

#3.6.1 Ensure iptables is installed (Scored)  
#3.6.2 Ensure default deny firewall policy (Scored)  
#3.6.3 Ensure loopback traffic is configured (Scored)  
#3.6.4 Ensure outbound and established connections are configured
#(Not Scored)  
#3.6.5 Ensure firewall rules exist for all open ports (Scored)  

#3.6.1 Ensure iptables is installed (Scored)

package 'iptables' do
        package_name 'iptables'
        action :install
end


#3.6.2 Ensure default deny firewall policy 


#3.6.3 Ensure loopback traffic is configured


#3.6.4 Ensure outbound and established connections are configured



#3.6.5 Ensure firewall rules exist for all open ports 





