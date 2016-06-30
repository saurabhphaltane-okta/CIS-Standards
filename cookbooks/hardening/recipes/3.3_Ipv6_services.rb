# Cookbook Name:: cis-amazonlinux-hardening
# # # # Recipe:: IPV6
# # # #saurabh phaltane
# # # # Copyright (c) 2016 The Authors, All Rights Reservied.

#3.3.1 Ensure IPv6 router advertisements are not accepted (Scored)  
#3.3.2 Ensure IPv6 redirects are not accepted (Scored)  
#3.3.3 Ensure IPv6 is disabled (Not Scored)  




#3.3.1 Ensure IPv6 router advertisements are not accepted 

  replace_or_add 'net.ipv6.conf.all.accept_ra=0' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv6.conf.all.accept_ra.*'
    line 'net.ipv6.conf.all.accept_ra = 0'
  end

   replace_or_add 'net.ipv6.conf.default.accept_ra=0' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv6.conf.default.accept_ra.*'
    line 'net.ipv6.conf.default.accept_ra = 0'
  end


  execute 'net.ipv6.conf.all.accept_ra=0' do
    command '/sbin/sysctl -w net.ipv6.conf.all.accept_ra=0'
    not_if '/sbin/sysctl -q -n net.ipv6.conf.all.accept_ra | /usr/bin/grep 0'
  end
  execute 'net.ipv6.conf.default.accept_ra=0' do
    command '/sbin/sysctl -w net.ipv6.conf.default.accept_ra=0'
    not_if '/sbin/sysctl -q -n net.ipv6.conf.default.accept_ra | /usr/bin/grep 0'
  end



#3.3.2 Ensure IPv6 redirects are not accepted



replace_or_add 'net.ipv6.conf.all.accept_redirects=0' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv6.conf.all.accept_redirects.*'
    line 'net.ipv6.conf.all.accept_redirects = 0'
  end

   replace_or_add 'net.ipv6.conf.default.accept_redirects=0' do
    path '/etc/sysctl.conf'
    pattern 'net.ipv6.conf.default.accept_redirects.*'
    line 'net.ipv6.conf.default.accept_redirects = 0'
  end


  execute 'net.ipv6.conf.all.accept_redirects=0' do
    command '/sbin/sysctl -w net.ipv6.conf.all.accept_redirects=0'
    not_if '/sbin/sysctl -q -n net.ipv6.conf.all.accept_redirects | /usr/bin/grep 0'
  end
  execute 'net.ipv6.conf.default.accept_redirects=0' do
    command '/sbin/sysctl -w net.ipv6.conf.default.accept_redirects=0'
    not_if '/sbin/sysctl -q -n net.ipv6.conf.default.accept_redirects | /usr/bin/grep 0'
  end

   execute 'net.ipv6.route.flush=1' do
    command '/sbin/sysctl -w net.ipv6.route.flush=1'
    not_if '/sbin/sysctl -q -n net.ipv6.route.flush | /usr/bin/grep 1'
  end





#3.3.3 Ensure IPv6 is disabled 

cookbook_file '/etc/modprobe.d/CIS.conf' do
  source 'CIS.conf'
  action :create
end








