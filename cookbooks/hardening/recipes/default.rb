#
# Cookbook Name:: cis-el7-l1-hardening
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
case node['platform_family']
when 'rhel'
  if node['platform_version'].to_f >= 7.0

    # Fix for "xccdf_org.cisecurity.benchmarks_rule_4.7_Enable_firewalld"
#    package 'firewalld'

 #   service 'firewalld' do
  #    supports :status => true
   #   action [:enable, :start]
   # end
    # End fix for "xccdf_org.cisecurity.benchmarks_rule_4.7_Enable_firewalld"

    # Start fix for xccdf_org.cisecurity.benchmarks_rule_1.5.2_Set_Permissions_on_bootgrub2grub.cfg
   # package 'Install grub2' do
    #  package_name 'grub2'
    #  action :install
   # end

   # file '/boot/grub2/grub.cfg' do
   #   mode '0600'
   #   owner 'root'
   #   group 'root'
   #   action :create
   # end
    # End fix for xccdf_org.cisecurity.benchmarks_rule_1.5.2_Set_Permissions_on_bootgrub2grub.cfg

    # Start fix for xccdf_org.cisecurity.benchmarks_rule_3.1_Set_Daemon_umask
   # package 'Install initscripts' do
   #   package_name 'initscripts'
   #   action :install
   # end

   # replace_or_add 'Set Daemon umask' do
   #   path '/etc/sysconfig/init'
   #   pattern 'umask 027'
   #   line 'umask 027'
   # end
    # End fix for xccdf_org.cisecurity.benchmarks_rule_3.1_Set_Daemon_umask

    # Recipe includes
 #   include_recipe 'hardening::5.2_ssh'
 #   include_recipe 'hardening::2.1_inetd_services'
 #   include_recipe 'hardening::2.2_special_purpose_services'
 #   include_recipe 'hardening::2.3_service_clients'
 #   include_recipe 'hardening::1.3_filesys_integrity_check'
 #   include_recipe 'hardening::1.2_configure_software_updates'
 #   include_recipe 'hardening::1.4_secure_boot_settings'
 #   include_recipe 'hardening::1.5_addional_process_hardening'
 #   include_recipe 'hardening::1.7_warning_banners'  
 #   include_recipe 'hardening::3.1_network_parameters' 
    include_recipe 'hardening::3.2_network_parameters' 
 #   include_recipe 'hardening::3.3_Ipv6_services'
 #   include_recipe 'hardening::1.1_filesystem_confirguration'
 #   include_recipe 'hardening::6.1_systemfile_permissions'
 #   include_recipe 'hardening::3.4_tcp_wrappers'
 #   include_recipe 'hardening::3.5_uncommon_network_protocols'
 #   include_recipe 'hardening::3.6_firewall_configuration'
    # include_recipe 'cis-el7-l1-hardening::cron'
   # include_recipe 'cis-el7-l1-hardening::at_daemon'
   # include_recipe 'cis-el7-l1-hardening::network-packet-remediation'
   # include_recipe 'cis-el7-l1-hardening::login_banners'
   # include_recipe 'cis-el7-l1-hardening::core_dumps'
   # include_recipe 'cis-el7-l1-hardening::rsyslog'
 #   include_recipe 'cis-el7-l1-hardening::ntp'
  #  include_recipe 'cis-el7-l1-hardening::user-mgmt'

    # This should be the last recipe thats run as it remediates
    # the shadow file to a CIS compliant standard.

#    include_recipe 'cis-el7-l1-hardening::passwords'

  end
end
