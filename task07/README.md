# task7

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Rename `knife.rb_back` file

    ```bash
    mv knife.rb_back knife.rb
    ```

2. Add new recipe `php.rb`

    ```ruby
    #install hpp and php-fpm
    ['php-fpm', 'php'].each do |p|
      package p do
        action :install
      end
    end

    #start and enable php-fpm service
    service 'php7.0-fpm' do
      action :start
      action :enable
    end
    ```

3. Add new recipe `nginx.rb`

    Add to `nginx.rb` file
    ```ruby
    package 'nginx' do
      action :install
    end

    service 'nginx' do
      action :start
      action :enable
    end
    ```

    Create a new file with template `templates/nginx_default.erb`
    ```bash
    server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm
        index.nginx-debian.html;

        server_name _;

        location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
    }

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        <% if @php_fastcgi == true %>
            # With php7.0-cgi alone:
            fastcgi_pass 127.0.0.1:9000;
        <% else %>
            # With php7.0-fpm:
            fastcgi_pass                unix:/run/php/php7.0-fpm.sock;
        <% end %>
        }
    }
    ```

    Add variable to `attributes/default.rb`
    ```ruby
    ...
    default['webserver']['php_fcgi'] = false
    ```

    Now add nginx configuration in `nginx.rb`
    ```ruby
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
    ``

4. Move content upload to new file `content.rb`

    In new file `content.rb`
    ```ruby
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
    ```

5. Add mising `info.php` file in `/files` dir

    ```php
    <?php
        phpinfo();
    ?>
    ```

6. Now modify `default.rb` like below

    ```ruby
    package 'apache2' do
      action :remove
    end

    include_recipe '::php'
    include_recipe '::nginx'
    include_recipe '::content'
    ```

7. Add cookbook to node

    ```bash
    knife node run_list set 'development-server' 'recipe[weberver]'
    ```

8. Run cookbook on node

    ```bash
    knife zero converge "chef_environment:development" --ssh-user vagrant
    ```
