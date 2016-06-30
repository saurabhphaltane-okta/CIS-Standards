# Cookbook Name:: cis-amazonlinux-hardening
# # # Recipe:: System File Permissions
# # #saurabh phaltane
# # # Copyright (c) 2016 The Authors, All Rights Reserved.  
#
# #CIS-Control 6
#6.1.1 Audit system file permissions (Not Scored)  
#6.1.2 Ensure permissions on /etc/passwd are configured (Scored)  
#6.1.3 Ensure permissions on /etc/shadow are configured (Scored)  
#6.1.4 Ensure permissions on /etc/group are configured (Scored)  
#6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)  
#6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)  
##6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)  
#6.1.8 Ensure permissions on /etc/group- are configured (Scored)  
#6.1.9 Ensure permissions on /etc/gshadow- are configured
#(Scored)  
#6.1.10 Ensure no world writable files exist (Scored)  
#6.1.11 Ensure no unowned files or directories exist (Scored)  
#6.1.12 Ensure no ungrouped files or directories exist (Scored)  
#6.1.13 Audit SUID executables (Not Scored)  
#6.1.14 Audit SGID executables (Not Scored)   



#6.1.2 Ensure permissions on /etc/passwd are configured
file '/etc/passwd' do
      mode 0644
      owner 'root'
      group 'root'
end


#6.1.3 Ensure permissions on /etc/shadow are configured 


file '/etc/shadow' do
      mode 0000
      owner 'root'
      group 'root'
end

#6.1.4 Ensure permissions on /etc/group are configured 


file '/etc/group' do
      mode 0644
      owner 'root'
      group 'root'
end


#6.1.5 Ensure permissions on /etc/gshadow are configured 


file '/etc/gshadow' do
      mode 0000
      owner 'root'
      group 'root'
end

#6.1.6 Ensure permissions on /etc/passwd- are configured

file '/etc/passwd' do
      mode 0600
      owner 'root'
      group 'root'
end

#6.1.7 Ensure permissions on /etc/shadow- are configured

file '/etc/shadow-' do
      mode 0600
      owner 'root'
      group 'root'
end

#6.1.8 Ensure permissions on /etc/group- are configured


file '/etc/group-' do
      mode 0600
      owner 'root'
      group 'root'
end


#6.1.9 Ensure permissions on /etc/gshadow- are configured

file '/etc/gshadow-' do
      mode 0600
      owner 'root'
      group 'root'
end

#6.1.10 Ensure no world writable files exist
#
#
#
#
#
#
#












