describe package('nginx') do
  it { should be_installed }
  its('version') { should match(%r{1.10.3.*}) }
end

describe file('/etc/nginx/sites-available/default') do
  its('content') { should match('server \{') }
  its('content') { should match('listen 80 default_server') }
  its('content') { should match('listen \[\:\:\]\:80 default_server') }
  its('mode') { should cmp '0644' }
  its('owner') { should eq 'root' }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end
