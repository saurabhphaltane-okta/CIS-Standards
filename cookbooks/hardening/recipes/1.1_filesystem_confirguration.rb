# Cookbook Name:: cis-amazonlinux-hardening
# # # # # Recipe:: FileSystem Configurations
# # # # #saurabh phaltane
# # # # # Copyright (c) 2016 The Authors, All Rights Reserved.
# #Control 1.1.1
#
#
# 1.1 Filesystem Configuration
# 1.1.1 Disable unused filesystems
# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)  
# 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)  
# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)  
# 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)  
# 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)  
# 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)  
# 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)  
# 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)  



template "/etc/modprobe.d/CIS.conf" do

  source "modprobe_cis.erb"
  owner "root"
  group "root"
  mode 0644
end

['cramfs', 'freevxfs', 'jffs2','hfs','hfsplus','squashfs','udf','vfat'].each do |fs_name|
     execute "Disable file system #{fs_name}" do
      command "echo 'install #{fs_name}' /bin/true >> /etc/modprobe.d/CIS.conf"
      not_if "output=$(/usr/bin/grep '#{fs_name}' /etc/modprobe.d/CIS.conf && echo $?"
    end
end

