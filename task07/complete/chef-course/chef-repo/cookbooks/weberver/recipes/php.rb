
['php-fpm', 'php'].each do |p|
  package p do
    action :install
  end
end

service 'php7.0-fpm' do
  action :start
  action :enable
end
