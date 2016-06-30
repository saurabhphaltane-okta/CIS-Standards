# Cookbook Name:: cis-amazonlinux-hardening
# # # # # # Recipe:: TCP Wrappers
# # # # # #saurabh phaltane
# # # # # # Copyright (c) 2016 The Authors, All Rights Reserved.
# # #Control 3.4



#3.4.1 Ensure TCP Wrappers is installed (Scored)  
#3.4.2 Ensure /etc/hosts.allow is configured (Scored)  
#3.4.3 Ensure /etc/hosts.deny is configured (Scored)  
#3.4.4 Ensure permissions on /etc/hosts.allow are configured
#(Scored)  
#3.4.5 Ensure permissions on /etc/hosts.deny are configured
#(Scored)  


%w( /etc/hosts.allow /etc/hosts.deny).each do |file|
   
 file "#{file}" do
      mode '0644'
      owner 'root'
    end
end
 package 'tcp_wrappers' do
      package_name 'tcp_wrappers'
      action :install
    end



