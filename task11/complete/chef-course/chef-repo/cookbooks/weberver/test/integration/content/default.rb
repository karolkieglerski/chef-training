describe file('/var/www/html/index.html') do
  its('content') { should match('hi, hello!') }
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'root' }
end

describe file('/var/www/html/welcome.html') do
  its('content') { should match('I\'m running on ubuntu platform') }
  its('content') { should match('My hostname is default-ubuntu-1604.vagrantup.com and my IP is 10.0.2.15') }
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'root' }
end

describe file('/var/www/html/info.php') do
  its('content') { should match(%r{<?php\n.*phpinfo().*}) }
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'root' }
end
