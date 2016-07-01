# Cookbook Name:: cis-amazonlinux-hardening
# # # # # # Recipe:: Logging and Auditing
# # # # # #saurabh phaltane
# # # # # # Copyright (c) 2016 The Authors, All Rights Reserved.
# # #Control 3.6


#4.1.1.1 Ensure audit log storage size is configured (Not Scored)  
#4.1.1.2 Ensure system is disabled when audit logs are full (Scored)  
#4.1.1.3 Ensure audit logs are not automatically deleted (Scored)  
#4.1.2 Ensure auditd service is enabled (Scored)  
#4.1.3 Ensure auditing for processes that start prior to auditd is
#enabled (Scored)  
#4.1.4 Ensure events that modify date and time information are
#collected (Scored)  
#4.1.5 Ensure events that modify user/group information are
#collected (Scored)  
#4.1.6 Ensure events that modify the system's network environment
#are collected (Scored)  
#4.1.7 Ensure events that modify the system's Mandatory Access
#Controls are collected (Scored)  
#4.1.8 Ensure login and logout events are collected (Scored)  
#4.1.9 Ensure session initiation information is collected (Scored)  
#4.1.10 Ensure discretionary access control permission modification
#events are collected (Scored)  
#4.1.11 Ensure unsuccessful unauthorized file access attempts are
#collected (Scored)  
#4.1.12 Ensure use of privileged commands is collected (Scored)  
#4.1.13 Ensure successful file system mounts are collected (Scored)  
#4.1.14 Ensure file deletion events by users are collected (Scored)  
#4.1.15 Ensure changes to system administration scope (sudoers) is
#collected (Scored)  
#4.1.16 Ensure system administrator actions (sudolog) are collected
#(Scored)  
#4.1.17 Ensure kernel module loading and unloading is collected
#(Scored)  
#4.1.18 Ensure the audit configuration is immutable (Scored)  



#4.1.1.1 Ensure audit log storage size is configured 


#replace_or_add '/etc/audit/auditd.conf' do
#     path '/etc/audit/auditd.conf'
#      pattern 'max_log_file.*'
#      line 'max_log_file = 6'
#end

#4.1.1.2 Ensure system is disabled when audit logs are full 

#replace_or_add 'space_left_action = email' do
#      path '/etc/audit/auditd.conf'
#      pattern 'space_left_action.*'
#      line 'space_left_action = email'
#end

#replace_or_add 'action_mail_acct = root' do
#      path '/etc/audit/auditd.conf'
#      pattern 'action_mail_acct.*'
#      line 'space_left_action = email'
#end


#replace_or_add 'admin_space_left_action = halt' do
#      path '/etc/audit/auditd.conf'
#      pattern 'admin_space_left_action.*'
#      line 'admin_space_left_action = halt'
#end


#4.1.1.3 Ensure audit logs are not automatically deleted


#replace_or_add 'max_log_file_action = keep_logs' do
#      path '/etc/audit/auditd.conf'
#      pattern 'max_log_file_action.*'
#      line 'max_log_file_action = keep_logs'
#end


template '/etc/audit/auditd.conf' do
  source 'auditd.conf.erb'
  owner 'root'
  group 'root'
  mode 00640
  variables(
    :admin_space_left_action=> node['auditd']['admin_space_left_action'],
    :space_left_action =>  node['auditd']['space_left_action'],
    :max_log_file_action => node['auditd']['max_log_file_action'],
    :action_mail_acct => node['auditd']['action_mail_acct'],
    :action_max_log_file => node['auditd']['max_log_file'] )
  notifies :restart, 'service[auditd]'
end




template '/etc/audit/audit.rules' do
  source 'audit.rules.erb'
  owner 'root'
  group 'root'
  mode 00640
end





#4.1.2 Ensure auditd service is enabled 

service 'auditd' do
    action [:enable]
 end

#4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)

#default['auditd']['max_log_file']=6
#4.1.1.2 Ensure system is disabled when audit logs are full 
#default['auditd']['space_left_action']='email'
#default['auditd']['action_mail_acct']='root'
#default['auditd']['admin_space_left_action']='halt'
##4.1.1.3 Ensure audit logs are not automatically deleted
#default['auditd']['max_log_file_action']='keep_logs'
















