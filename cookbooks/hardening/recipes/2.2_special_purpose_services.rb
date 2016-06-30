# Cookbook Name:: cis-amazonlinux-hardening
# # Recipe:: special_purpose_services 
# #saurabh phaltane
# # Copyright (c) 2016 The Authors, All Rights Reserved.  

#CIS-Control 2.2[1-16]

#2.2.1 Time Synchronization
#2.2.1.1 Ensure time synchronization is in use (Not Scored)  
#2.2.1.2 Ensure ntp is configured (Scored)  
#2.2.1.3 Ensure chrony is configured (Scored)  
#2.2.2 Ensure X Window System is not installed (Scored)  
#2.2.3 Ensure Avahi Server is not enabled (Scored)  
#2.2.4 Ensure CUPS is not enabled (Scored)  
#2.2.5 Ensure DHCP Server is not enabled (Scored)  
#2.2.6 Ensure LDAP server is not enabled (Scored)  
#2.2.7 Ensure NFS and RPC are not enabled (Scored)  
#2.2.8 Ensure DNS Server is not enabled (Scored)  
#2.2.9 Ensure FTP Server is not enabled (Scored)  
#2.2.10 Ensure HTTP server is not enabled (Scored)  
#2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)  
#2.2.12 Ensure Samba is not enabled (Scored)  
#2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)  
#2.2.14 Ensure SNMP Server is not enabled (Scored)  
#2.2.15 Ensure mail transfer agent is configured for local-only mode
#(Scored)  
#2.2.16 Ensure NIS Server is not enabled (Scored)  


%w( xorg-x11* cups dhcpd  slapd nfs rpcbind named vsftpd httpd davecot smb squid snmpd vpserv).each do |package|
   service "#{package}" do
    action [:disable]
  end
end


#CIS Control 2.2.15
replace_or_add 'Ensure mail transfer agent is configured for local-only mode' do
   path '/etc/postfix/main.cf'
   pattern 'inet_interfaces.*'
   line 'inet_interfaces = localhost'
   only_if { File.exist? '/etc/postfix/main.cf' }
end

#CIS Control 2.2.1.2
#Ensure Time Synchronization is in use and NTP is configured.
    package 'ntp' do
        package_name 'ntp'
        action :install
      end

    # Create file ntp.conf if not present
    file '/etc/ntp.conf' do
      mode '0644'
      owner 'root'
    end

    # Correct ntp.conf config to conform to:
    # /^\s*restrict\s+default(?=[^#]*\s+kod)(?=[^#]*\s+nomodify)(?=[^#]*\s+notrap)(?=[^#]*\s+nopeer)(?=[^#]*\s+noquery)(\s+kod|\s+nomodify|\s+notrap|\s+nopeer|\s+noquery)*\s*(?:#.*)?$/
    replace_or_add 'Add kod to default restrict list in ntp.conf for IP V4' do
      path '/etc/ntp.conf'
      pattern "^restrict\sdefault"
      line 'restrict default kod nomodify notrap nopeer noquery'
    end

    # Correct ntp.conf config to conform to:
    # /^\s*restrict\s+-6\s+default(?=[^#]*\s+kod)(?=[^#]*\s+nomodify)(?=[^#]*\s+notrap)(?=[^#]*\s+nopeer)(?=[^#]*\s+noquery)(\s+kod|\s+nomodify|\s+notrap|\s+nopeer|\s+noquery)*\s*(?:#.*)?$/ }
    replace_or_add 'Add default restrict list in ntp.conf with a -6 for IP V6 activity' do
      path '/etc/ntp.conf'
      pattern "^restrict\s-6\sdefault"
      line 'restrict -6 default kod nomodify notrap nopeer noquery'
    end

    # Create file ntpd if not present
    file '/etc/sysconfig/ntpd' do
      mode '0644'
      owner 'root'
    end

    # Correct ntpd config to conform to:
    # /^\s*OPTIONS="[^"]*-u ntp:ntp[^"]*"\s*(?:#.*)?$/
    replace_or_add 'ntpd' do
      path '/etc/sysconfig/ntpd'
      pattern 'OPTIONS='
      line 'OPTIONS="-u ntp:ntp -p /var/run/ntpd.pid -g"'
    end

