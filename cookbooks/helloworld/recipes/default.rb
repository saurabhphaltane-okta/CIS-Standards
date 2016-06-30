#
# Cookbook Name:: helloworld
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


#
#template '/tmp/default' do
#  source 'helloworld.txt.erb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#end#

#node.default[:fqdn] = 'latte'
node.default[:fqdn] = 'latte'
template '/tmp/foo' do
  source 'foo.erb'
  variables({
    :x_men => 'are keen'
  })
end
