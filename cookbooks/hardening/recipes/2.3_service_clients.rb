# Cookbook Name:: cis-amazonlinux-hardening
# # Recipe:: Service_clients
# #saurabh phaltane
# # Copyright (c) 2016 The Authors, All Rights Reserved.  

#CIS-Control 2.3[1-5]

#2.3.1 Ensure NIS Client is not installed (Scored)  
#2.3.2 Ensure rsh client is not installed (Scored)  
#2.3.3 Ensure talk client is not installed (Scored)  
#2.3.4 Ensure telnet client is not installed (Scored)  
#2.3.5 Ensure LDAP client is not installed (Scored)  

%w( ypbind  rsh talk telnet openldap-clients).each do |package|
   package "#{package}" do
    action [:remove]
  end
end

