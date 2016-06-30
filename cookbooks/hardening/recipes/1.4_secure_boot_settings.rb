# Cookbook Name:: cis-amazonlinux-hardening
# # # Recipe:: secure_boot_settings
# # #saurabh phaltane
# # # Copyright (c) 2016 The Authors, All Rights Reserved.

#1.4.1 Ensure permissions on bootloader config are configured  
#1.4.2 Ensure authentication required for single user mode (Scored)  
#1.4.3 Ensure interactive boot is not enabled (Scored)  
#
 file '/boot/grub/menu.lst' do
  owner 'root'
  group 'root'
  mode '0600'
end


replace_or_add 'Ensure authentication required for single user mode' do
      path '/etc/sysconfig/init'
      pattern 'SINGLE.*'
      line 'SINGLE=/sbin/sulogin'
     # notifies :create, 'file[sshd.changed]', :immediately
end


replace_or_add 'Ensure interactive boot is not enabled' do
      path '/etc/sysconfig/init'
      pattern 'PROMPT.*'
      line 'PROMPT=no'
     # notifies :create, 'file[sshd.changed]', :immediately
end



