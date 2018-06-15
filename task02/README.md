# task2

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course`) what we created in last task.

1. Generate chef repository and name it `chef-repo`

    ```bash
    chef generate repo chef-repo
    ```

2. Create chef configuration directory in user home directory

    ```bash
    mkdir -p ~/.chef
    ```

3. Generate certificates

    ```bash
    #client-key
    openssl genrsa -out ~/.chef/$USER.pem 2048

    #validation-key
    openssl genrsa -out ~/.chef/chef-validator.pem 2048
    ```

4. Set default editor in terminal

    I use a `vim` if you want to use for exaple `nano` or `mcedit` use it.

    ```bash
    export EDITOR=vim
    ```

5. Configure chef knife

    ```bash
    knife configure

    mkdir -p .chef/

    cat <<EOT > .chef/knife.rb
        current_dir = File.dirname(__FILE__)
        user = ENV['OPSCODE_USER'] || ENV['USER']
        node_name                user
        client_key               "#{ENV['HOME']}/.chef/#{ENV['USER']}.pem"
        validation_client_name   "#{ENV['ORGNAME']}-validator"
        validation_key           "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"
        chef_server_url          'http://127.0.0.1:8889' #chef-zero server url
        syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntax_check_cache"
        cookbook_path            ["#{current_dir}/../cookbooks"]
    EOT
    ```
