# task5

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Write recipe to run webserver

    Install an apache server
    ```ruby
    package 'apache2' do
      action :install
    end
    ```

    Start an apache server
    ```ruby
    service 'apache2' do
      action :start
      action :enable
    end
    ```

    Add custom index.html file
    ```ruby
    cookbook_file "/var/www/html/index.html" do
      source 'index.html'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    ```

    Create directory `files` and into that directory create `index.html` file with content like bellow
    ```thml
    <h1>hi, hello!</h1>
    ```

    Also add a `attributes` dir to store all variables. Create into this dir a `default.rb` file with one variable
    ```ruby
    default['webserver']['contentPath'] = '/var/www/html'

    ```

    Now change path to variable
    ```ruby
    ...
    cookbook_file "#{node['webserver']['contentPath']}/index.html" do
    ...
    ```

    Generate template with new hmtl file
    ```bash
    chef generate template cookbooks/weberver index.html
    ```

    add to this file simple ruby template
    ```html
    <html>
        <h1>I'm running on <%= @hostname %></h1>
        <p>My hostname is <%= node['fqdn'] %> and my IP is <%= node['ipaddress'] %>
    </html>
    ```

    Finaly create new html file on server by step in recipe
    ```ruby
    template "#{node['webserver']['contentPath']}/welcome.html" do
      source 'index.html.erb'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
      variables(hostname: "#{node['platform']} platform")
    end
    ```

2. Show all your nodes

    ```bash
    knife search node "name:*"
    ```

3. Show nodes in development environment

    ```bash
    knife search node "chef_environment:development"
    ```

4. Converge the server

    ```bash
    #empty converge
    knife zero converge "name:development-server" --ssh-user vagrant

    #deployment-server converge
    knife zero converge "name:development-server" --ssh-user vagrant --override-runlist example

    #chef environment converge
    knife zero converge "chef_environment:development" --ssh-user vagrant --override-runlist example

    #converge with webserver cookbook
    knife zero converge "name:development-server" --ssh-user vagrant --override-runlist webserver
    ```
