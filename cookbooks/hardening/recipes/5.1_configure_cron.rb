# Cookbook Name:: cis-amazonlinux-hardening
# # # # # Recipe:: configure cron 
# # # # #saurabh phaltane
# # # # # Copyright (c) 2016 The Authors, All Rights Reservedi



#5.1.1Ensure cron daemon is enabled (Scored)
#5.1.2Ensure permissions on /etc/crontab are configured (Scored)
#5.1.3Ensure permissions on /etc/cron.hourly are configured (Scored)
#5.1.4Ensure permissions on /etc/cron.daily are configured (Scored)
#5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)
#5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
#5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)
#5.1.8 Ensure at/cron is restricted to authorized users (Scored)

#5.1.1Ensure cron daemon is enabled (Scored)

service 'crond' do 

  action :enable

end

#5.1.2Ensure permissions on /etc/crontab are configured (Scored)
##5.1.3Ensure permissions on /etc/cron.hourly are configured (Scored)
##5.1.4Ensure permissions on /etc/cron.daily are configured (Scored)
##5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)
##5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
##5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)


file '/etc/crontab' do
      mode '0644'
      owner 'root'
      owner 'root'
    end


%w( /etc/cron.hourly /etc/cron.daily  /etc/cron.weekly /etc/cron.monthly /etc/cron.d).each do |file|

 directory "#{file}" do
      mode '0644'
      owner 'root'
      owner 'root'
    end
end 

#5.1.8 Ensure at/cron is restricted to authorized users 


%w(/etc/cron.deny /etc/at.deny ).each do |file|

file "#{file}" do
  action :delete
  only_if { File.exist? "#{file}" }
end


end 



%w(/etc/cron.allow /etc/at.allow).each do |file|

file "#{file}" do
  action :create
   mode '0600'
   owner 'root'  
   group 'root'
 end


end 


