# Cookbook Name:: cis-amazonlinux-hardening
# # # # Recipe:: Network Parameters
# # # #saurabh phaltane
# # # # Copyright (c) 2016 The Authors, All Rights Reserved.

#3.1.1 Ensure IP forwarding is disabled (Scored)  
#3.1.2 Ensure packet redirect sending is disabled (Scored)  


  replace_or_add 'Ensure IP forwarding is disabled' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv4.ip_forward.*'
    line 'net.ipv4.ip_forward = 0'
  end

  execute 'net.ipv4.ip_forward=0' do
    command '/sbin/sysctl -w net.ipv4.ip_forward=0'
    not_if '/sbin/sysctl -q -n net.ipv4.ip_forward | /usr/bin/grep 0'
  end
  execute 'net.ipv4.route.flush=1' do
    command '/sbin/sysctl -w net.ipv4.route.flush=1'
    not_if '/sbin/sysctl -q -n net.ipv4.route.flush | /usr/bin/grep 1'
  end



#3.1.2 Ensure packet redirect sending is disabled 


 replace_or_add 'Ensure Packet Redirect is disabled' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv4.conf.all.send_redirects.*'
    line 'net.ipv4.conf.all.send_redirects=0'
  end


replace_or_add 'Ensure Packet Default Redirect is disabled' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv4.conf.default.send_redirects.*'
    line 'net.ipv4.conf.default.send_redirects=0'
  end



 execute 'ipv4.conf.all.send_redirects=0' do
    command '/sbin/sysctl -w net.ipv4.conf.all.send_redirects=0'
    not_if '/sbin/sysctl -q -n net.ipv4.conf.all.send_redirects | /usr/bin/grep 0'
  end


execute 'net.ipv4.conf.default.send_redirects=0' do
    command '/sbin/sysctl -w net.ipv4.conf.default.send_redirects=0'
    not_if '/sbin/sysctl -q -n net.ipv4.conf.default.send_redirects | /usr/bin/grep 0'
  end








