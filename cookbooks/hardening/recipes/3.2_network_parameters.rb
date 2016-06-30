# Cookbook Name:: cis-amazonlinux-hardening
# # # # Recipe:: Network Parameters hosts and Routers
# # # #saurabh phaltane
# # # # Copyright (c) 2016 The Authors, All Rights Reserved.

#3.2.1 Ensure source routed packets are not accepted (Scored)  
#3.2.2 Ensure ICMP redirects are not accepted (Scored)  
#3.2.3 Ensure secure ICMP redirects are not accepted (Scored)  
#3.2.4 Ensure suspicious packets are logged (Scored)  
#3.2.5 Ensure broadcast ICMP requests are ignored (Scored)  
#3.2.6 Ensure bogus ICMP responses are ignored (Scored)  
#3.2.7 Ensure Reverse Path Filtering is enabled (Scored)  
#3.2.8 Ensure TCP SYN Cookies is enabled (Scored)  


#3.2.1 Ensure source routed packets are not accepted


template '/tmp/sysctl.conf' do
  source 'sysctl.conf.erb'
 # variables({
 # :network_var => node['configs']['config_var']
#})
end

# replace_or_add "#{node['net.ipv4.conf']['all']['accept_source_route']['parameter']} = #{node['net.ipv4.conf']['all']['accept_source_route']['status']}" do
#    path "#{node['sysctl']['conf']}"
#    pattern "#{node['net.ipv4.conf']['all']['accept_source_route']['parameter']}.*"
#    line "#{node['net.ipv4.conf']['all']['accept_source_route']['parameter']} = #{node['net.ipv4.conf']['all']['accept_source_route']['status']}"
#  end



#  replace_or_add 'net.ipv4.conf.all.accept_source_route=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.all.accept_source_route.*'
#    line 'net.ipv4.conf.all.accept_source_route=0'
#  end
#  replace_or_add 'net.ipv4.conf.default.accept_source_route=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.default.accept_source_route.*'
#    line 'net.ipv4.conf.default.accept_source_route=0'
#  end
#  execute 'net.ipv4.conf.all.accept_source_route=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.all.accept_source_route=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.accept_source_route | /usr/bin/grep 0'
#  end
#  execute 'net.ipv4.conf.default.accept_source_route=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.default.accept_source_route=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.accept_source_route | /usr/bin/grep 0'
#  end
#
#
# execute 'net.ipv4.route.flush=1' do
#    command '/sbin/sysctl -w net.ipv4.route.flush=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.route.flush | /usr/bin/grep 1'
#  end
#
#
#
#
#
# # 3.2.2 Addresses ICMP Redirect Acceptance
#  replace_or_add 'enable_net.ipv4.conf.all.accept_redirects=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.all.accept_redirects'
#    line 'net.ipv4.conf.all.accept_redirects=0'
#  end
#  replace_or_add 'enable_net.ipv4.conf.default.accept_redirects=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.default.accept_redirects'
#    line 'net.ipv4.conf.default.accept_redirects=0'
#  end
#  execute 'update_net.ipv4.conf.all.accept_redirects=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.all.accept_redirects=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.accept_redirects | /usr/bin/grep 0'
#  end
#  execute 'update_net.ipv4.conf.default.accept_redirects=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.default.accept_redirects=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.accept_redirects | /usr/bin/grep 0'
#  end
#  # End ICMP Redirect Acceptance
#
#
#
## 3.2.3 Addresses Secure ICMP Redirect Acceptance
#  replace_or_add 'enable_net.ipv4.conf.all.secure_redirects=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.all.secure_redirects'
#    line 'net.ipv4.conf.all.secure_redirects=0'
#  end
#  replace_or_add 'enable_net.ipv4.conf.default.secure_redirects=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.default.secure_redirects'
#    line 'net.ipv4.conf.default.secure_redirects=0'
#  end
#  execute 'update_net.ipv4.conf.all.secure_redirects=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.all.secure_redirects=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.secure_redirects | /usr/bin/grep 0'
#  end
#  execute 'update_net.ipv4.conf.default.secure_redirects=0' do
#    command '/sbin/sysctl -w net.ipv4.conf.default.secure_redirects=0'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.secure_redirects | /usr/bin/grep 0'
#  end
#  # End ICMP Redirect Acceptance
#
##3.2.4  Addresses Log Suspicious Packets
#  replace_or_add 'enable_update_net.ipv4.conf.all.log_martians=1' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.all.log_martians'
#    line 'net.ipv4.conf.all.log_martians=1'
#  end
#  replace_or_add 'enable_net.ipv4.conf.default.log_martians=1' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.default.log_martians'
#    line 'net.ipv4.conf.default.log_martians=1'
#  end
#  execute 'update_net.ipv4.conf.all.log_martians=1' do
#    command '/sbin/sysctl -w net.ipv4.conf.all.log_martians=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.log_martians | /usr/bin/grep 1'
#  end
#  execute 'update_net.ipv4.conf.default.log_martians=1' do
#    command '/sbin/sysctl -w net.ipv4.conf.default.log_martians=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.log_martians | /usr/bin/grep 1'
#  end
#  # End
#
##3.2.5 Ensure broadcast ICMP requests are ignored
#
#  replace_or_add 'enable_net.ipv4.conf.default.accept_redirects=0' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.icmp_echo_ignore_broadcasts.*'
#    line 'net.ipv4.icmp_echo_ignore_broadcasts = 1'
#  end
#  execute 'net.ipv4.icmp_echo_ignore_broadcasts=1' do
#    command '/sbin/sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.icmp_echo_ignore_broadcasts | /usr/bin/grep 1'
#  end
#
#
##3.2.6 Ensure bogus ICMP responses are ignored
#
#   replace_or_add 'enable_net.ipv4.icmp_ignore_bogus_error_responses=1' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.icmp_ignore_bogus_error_responses.*'
#    line 'net.ipv4.icmp_ignore_bogus_error_responses = 1'
#  end
#  execute 'net.ipv4.icmp_ignore_bogus_error_responses=1' do
#    command '/sbin/sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.icmp_ignore_bogus_error_responses | /usr/bin/grep 1'
#  end
#
#
#
#
#
##3.2.7 Ensure Reverse Path Filtering is enabled 
#  replace_or_add 'enable_update_net.net.ipv4.conf.all.rp_filter=1' do
#    path '/etc/sysctl.conf'
#    pattern 'net.net.ipv4.conf.all.rp_filter'
#    line 'net.ipv4.conf.all.rp_filter=1'
#  end
#  replace_or_add 'enable_net.ipv4.conf.default.rp_filter' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.conf.default.rp_filter.*'
#    line 'net.ipv4.conf.default.rp_filter=1'
#  end
#  execute 'enable_update_net.net.ipv4.conf.all.rp_filter=1' do
#    command '/sbin/sysctl -w net.ipv4.conf.all.rp_filter=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.rp_filter| /usr/bin/grep 1'
#  end
#  execute 'update_net.ipv4.conf.default.rp_filter=1' do
#    command '/sbin/sysctl -w net.ipv4.conf.default.rp_filter=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.rp_filter  | /usr/bin/grep 1'
#  end
#  # End
#
#
##3.2.8 Ensure TCP SYN Cookies is enabled
#
#replace_or_add 'enable_net.ipv4.tcp_syncookies=1' do
#    path '/etc/sysctl.conf'
#    pattern 'net.ipv4.tcp_syncookies.*'
#    line 'net.ipv4.tcp_syncookies=1'
#  end
#  execute 'update_net.ipv4.tcp_syncookies=1' do
#    command '/sbin/sysctl -w net.ipv4.tcp_syncookies=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.tcp_syncookies=1 | /usr/bin/grep 1'
#  end
#
#
#
#execute 'net.ipv4.route.flush=1' do
#    command '/sbin/sysctl -w net.ipv4.route.flush=1'
#    not_if '/sbin/sysctl -q -n net.ipv4.route.flush | /usr/bin/grep 1'
#  end
#
#
#
#
