# Cookbook Name:: cis-amazonlinux-hardening
# # # Recipe:: all 
# # #saurabh phaltane
# # # Copyright (c) 2016 The Authors, All Rights Reserved.  
#
# #CIS-Control default 

case node['platform_family']
when 'rhel'
  if node['platform_version'].to_f >= 7.0


    # Recipe includes
    include_recipe 'hardening::5.2_ssh'
    include_recipe 'hardening::2.1_inetd_services'
    include_recipe 'hardening::2.2_special_purpose_services'
    include_recipe 'hardening::2.3_service_clients'
    include_recipe 'hardening::1.3_filesys_integrity_check'
    include_recipe 'hardening::1.2_configure_software_updates'
    include_recipe 'hardening::1.4_secure_boot_settings'
    include_recipe 'hardening::1.5_addional_process_hardening'
    include_recipe 'hardening::1.7_warning_banners'  
    include_recipe 'hardening::3.1_network_parameters' 
    include_recipe 'hardening::3.2_network_parameters' 
    include_recipe 'hardening::4.1_Logging_Auditing_dataretn'

    include_recipe 'hardening::3.3_Ipv6_services'
    include_recipe 'hardening::1.1_filesystem_confirguration'
    include_recipe 'hardening::6.1_systemfile_permissions'
    include_recipe 'hardening::3.4_tcp_wrappers'
    include_recipe 'hardening::3.5_uncommon_network_protocols'
    include_recipe 'hardening::3.6_firewall_configuration'
    include_recipe 'hardening::4.2.configure_logging' 
    include_recipe 'hardening::5.1_configure_cron'
   end
end
