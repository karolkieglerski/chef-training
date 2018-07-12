# task8

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Got to your cookbook directory and install cookbook

    ```bash
    cd cookbooks/webserver
    knife cookbook site install php
    ```

    See what happend and why ton't use this command.

2. Install dependences with `berks`

    endit your role dependency file `metadata.rb`
    ```ruby
    ...
    depends 'php', '~> 6.0.0'
    ...
    ```

    or `Berkfile`
    ```ruby
    ...
    cookbook 'php', '~> 6.0.0'
    ...
    ```

    then install dependences
    ```bash
    berks install
    ```

3. Delete `php.rb` file and edit `default.rb`

    Change from `'::php'` to `'php'`
    ```ruby
    ...
    include_recipe 'php'
    ...
    ```

4. Run cookbook

    ```bash
    knife zero converge "chef_environment:development" --ssh-user vagrant
    ```
