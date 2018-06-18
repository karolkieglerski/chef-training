#
# Cookbook:: weberver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'apache2' do
  action :install
end

cookbook_file "#{node['webserver']['contentPath']}/index.html" do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "#{node['webserver']['contentPath']}/welcome.html" do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  variables(hostname: "#{node['platform']} platform")
end


service 'apache2' do
  action :start
  action :enable
end
