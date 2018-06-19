
package 'nginx' do
  action :install
end

service 'nginx' do
  action :start
  action :enable
end

template '/etc/nginx/sites-available/default' do
  source 'nginx_default.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  variables(php_fastcgi: node['webserver']['php_fcgi'])
end

service 'nginx' do
  subscribes :reload, 'template[/etc/nginx/sites-available/default]', :immediately
end
