# Cookbook Name:: cis-amazonlinux-hardening
# # # # Recipe:: warning_banners
# # # #saurabh phaltane
# # # # Copyright (c) 2016 The Authors, All Rights Reserved.
#
#1.7.1 Command Line Warning Banners
#1.7.1.1 Ensure message of the day is configured properly (Scored)  
#1.7.1.2 Ensure local login warning banner is configured properly
#(Not Scored)  
#1.7.1.3 Ensure remote login warning banner is configured properly
#(Not Scored)  
#1.7.1.4 Ensure permissions on /etc/motd are configured (Not
#Scored)  
#1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)  
#1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not
#Scored)  #




template "/etc/issue" do 

  source "issues_banner.erb"
  owner "root"
  group "root"
  mode 0644
end

['/etc/motd', '/etc/issue', '/etc/issue.net'].each do |loginfile|
    file loginfile do
      mode 0644
      owner 'root'
      group 'root'
      action :create
    end

    execute "Delete OS Version from #{loginfile}" do
      command "/usr/bin/sed -i 's/\\\\v/REDACTED_OSVER/g' #{loginfile}"
      not_if "/usr/bin/grep REDACTED_OSVER #{loginfile}"
      only_if "/usr/bin/grep '\\\\v' #{loginfile}"
    end

    execute "Delete Kernel Version from #{loginfile}" do
      command "/usr/bin/sed -i 's:\\\\r:REDACTED_KERNELVER:g' #{loginfile}"
      not_if "/usr/bin/grep REDACTED_KERNELVER #{loginfile}"
      only_if "/usr/bin/grep '\\\\r' #{loginfile}"
    end

    execute "Delete Machine Architecture from #{loginfile}" do
      command "/usr/bin/sed -i 's/\\\\m/REDACTED_ARCH/g' #{loginfile}"
      not_if "/usr/bin/grep REDACTED_ARCH #{loginfile}"
      only_if "/usr/bin/grep '\\\\m' #{loginfile}"
    end

    execute "Delete OS used from #{loginfile}" do
      command "/usr/bin/sed -i 's/\\\\s/REDACTED_OS/g' #{loginfile}"
      not_if "/usr/bin/grep REDACTED_OS #{loginfile}"
      only_if "/usr/bin/grep '\\\\s' #{loginfile}"
    end
  end

