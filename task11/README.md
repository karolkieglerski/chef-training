# task11

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Create tests directories

    Create folders and files with no content
    * `cookbooks/weberver/test/integration/nginx/default.rb`
    * `cookbooks/weberver/test/integration/content/default.rb`

    Verify kitchen
    ```bash
    kitchen converge
    kitchen verify
    ```

    ```bash
    -----> Starting Kitchen (v1.20.0)

    ...

    Target:  ssh://vagrant@127.0.0.1:2222

      User root
         ↺
      Port 80
         ✔  should be listening

    ...

    Target:  ssh://vagrant@127.0.0.1:2222

         No tests executed.

    ...

    Target:  ssh://vagrant@127.0.0.1:2222

         No tests executed.

    Test Summary: 1 successful, 0 failures, 1 skipped
           Finished verifying <default-ubuntu-1604> (0m0.18s).
    -----> Kitchen is finished. (0m1.90s)
    ```

2. Edit default tests

    ```bash
    ...

    describe port(80) do
      it { should be_listening }
    end
    ```

3. Run nginx tests

    ```bash
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
    ```

4. Run content tests

    ```bash
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
    ```

5. Test your cookbook

    ```bash
    kitchen converge
    kitchen verify
    ```
