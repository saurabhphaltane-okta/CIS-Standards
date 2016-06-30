# Cookbook Name:: cis-amazonlinux-hardening
# # # # Recipe:: configure_software_updates
# # # #saurabh phaltane
# # # # Copyright (c) 2016 The Authors, All Rights Reserved.
#Control 1.2


 replace_or_add 'Ensure GPG Check is enabled globally' do
      path '/etc/yum.conf'
      pattern 'gpgcheck.*'
      line 'gpgcheck=1'
     # notifies :create, 'file[sshd.changed]', :immediately
 end
