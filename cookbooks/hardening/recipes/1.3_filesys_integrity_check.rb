# Cookbook Name:: cis-amazonlinux-hardening
# # # Recipe:: Service_clients
# # #saurabh phaltane
# # # Copyright (c) 2016 The Authors, All Rights Reserved.

#1.3.1 Ensure AIDE is installed (Scored)  
#1.3.2 Ensure filesystem integrity is regularly checked (Scored)  


package 'aide' do
  action :install
end


execute 'Initialize AIDE' do
  command 'aide --init && mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz'
end



cron 'filesystem_integrity_check' do
  action node.tags.include?('cookbooks-report') ? :create : :delete
  minute '0'
  hour '5'
  weekday '*'
  user 'root'
  command '/usr/sbin/aide --check' 
end
