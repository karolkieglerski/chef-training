# task9

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Create role file `roles/webserver.rb` or json if you want

    This file must contain something like below

    ```ruby
    name 'webserver'
    description 'This is webseerver role to run cookbooks'

    default_attributes()
    override_attributes()

    run_list  'recipe[example]',
              'recipe[weberver]'

    ```

2. Run your role

    ```
    knife zero converge "chef_environment:development" --ssh-user vagrant --override-runlist 'role[webserver]'
    ```

3. Add role as default run list

  ```
  knife node run_list set 'development-server' 'role[webserver]'
  ```

4. Run converge without overriding

  ```
  knife zero converge "chef_environment:development" --ssh-user vagrant
  ```
