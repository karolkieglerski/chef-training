
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

cookbook_file "#{node['webserver']['contentPath']}/info.php" do
  source 'info.php'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
