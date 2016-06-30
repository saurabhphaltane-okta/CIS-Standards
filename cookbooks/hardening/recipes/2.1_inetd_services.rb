# Cookbook Name:: cis-amazonlinux-hardening
# # Recipe:: inetd_services 
# #saurabh phaltane
# # Copyright (c) 2016 The Authors, All Rights Reserved.  

#CIS-Control 2.1[1-11]

#2.1 inetd Services
#2.1.1 Ensure chargen services are not enabled (Scored)  
#2.1.2 Ensure daytime services are not enabled (Scored)  
#2.1.3 Ensure discard services are not enabled (Scored)  
#2.1.4 Ensure echo services are not enabled (Scored)  
#2.1.5 Ensure time services are not enabled (Scored)  
#2.1.6 Ensure rsh server is not enabled (Scored)  
#2.1.7 Ensure talk server is not enabled (Scored)  
#2.1.8 Ensure telnet server is not enabled (Scored)  
#2.1.9 Ensure tftp server is not enabled (Scored)  
#2.1.10 Ensure rsync service is not enabled (Scored)  
#2.1.11 Ensure xinetd is not enabled (Scored)  
#



%w( rsh chargen daytime discard echo time talk telnet tftp rsync xinetd ).each do |package|
   service "#{package}" do
    action [:disable]
  end
end
