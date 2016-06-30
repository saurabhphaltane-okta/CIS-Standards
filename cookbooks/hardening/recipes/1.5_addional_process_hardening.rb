# Cookbook Name:: cis-amazonlinux-hardening
# # # Recipe:: addional_process_hardening
# # #saurabh phaltane
# # # Copyright (c) 2016 The Authors, All Rights Reserved.


#1.5.1 Ensure core dumps are restricted (Scored)  
#1.5.2 Ensure XD/NX support is enabled (Not Scored)  
#1.5.3 Ensure address space layout randomization (ASLR) is enabled
#(Scored)  
#1.5.4 Ensure prelink is disabled (Scored)  


bash "insert_line" do
  user "root"
  code <<-EOS
  echo "* hard core 0" >> /etc/sysconfig/init
  EOS
  not_if "grep -q  '* hard core 0' /etc/sysconfig/init"
end


replace_or_add 'Ensure interactive boot is not enabled' do
      path '/etc/sysctl.conf'
      pattern 'fs.suid_dumpable.*'
      line 'fs.suid_dumpable = 0'
end

#Run the following command to set the active kernel parameter:


#set the active kernel parameter


execute 'Enabled the sysctl parameters' do
      command 'sysctl -w fs.suid_dumpable=0'
end


#1.5.2 Ensure XD/NX support is enabled



#1.5.3 Ensure address space layout randomization


replace_or_add 'Ensure interactive boot is not enabled' do
      path '/etc/sysctl.conf'
      pattern 'kernel.randomize_va_space.*'
      line 'kernel.randomize_va_space = 2'
 end

execute 'Enabled the sysctl parameters' do
      command 'sysctl -w kernel.randomize_va_space=2' 
end



#1.5.4 Ensure prelink is disabled and uninstall prelink:

execute 'restore binaries to normal' do
      command 'prelink -ua' 
      only_if "rpm -q prelink" 

end


package "prelink" do
  action :remove
end










 







