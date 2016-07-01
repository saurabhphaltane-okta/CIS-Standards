# Cookbook Name:: cis-amazonlinux-hardening
# # # # # Recipe:: Network Parameters
# # # # #saurabh phaltane
# # # # # Copyright (c) 2016 The Authors, All Rights Reserved


#4.2.1.1 Ensure rsyslog Service is enabled 

service 'rsyslog' do
    action [:enable]
 end


#4.2.1.2 Ensure logging is configured (template)
#4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
template '/etc/rsyslog.conf' do
  source 'rsyslog.conf.erb'
  owner 'root'
  group 'root'
  mode 00640
end

#4.2.1.4 Ensure rsyslog is configured to send logs to a remote log hos


#replace_or_add 'Ensure remote rsyslog messages are only accepted on designated log hosts' do
#    path '/etc/rsyslog.conf'
#    pattern '*.\$ModLoad imtcp.so'
#    line '$ModLoad imtcp.so'
#  end









