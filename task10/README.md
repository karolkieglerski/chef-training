# task10

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Kitchen runs for cookbooks separately, go to `cookbooks/webserver` and edit `.kitchen.yml`

    Remove unnecessary centOS platform
    ```ruby
    ...
    platforms:
      - name: ubuntu-16.04
    ...
    ```

    Test recipe separately
    ```ruby
    ...
    run_list:
      - recipe[weberver::nginx]
      - recipe[weberver::content]
    ...
    ```

    Add different test files
    ```ruby
    ...
    verifier:
      inspec_tests:
        - test/integration/default
        - test/integration/nginx
        - test/integration/content
    ...
    ```

2. Run kitchen

    Check kitchens
    ```bash
    kitchen list

    Instance             Driver   Provisioner  Verifier  Transport  Last Action    Last Error
    default-ubuntu-1604  Vagrant  ChefZero     Inspec    Ssh        <Not Created>  <None>
    ```

    Create kitchen
    ```bash
    kitchen create
    ```

    Check kitchens
    ```bash
    kitchen list

    Instance             Driver   Provisioner  Verifier  Transport  Last Action  Last Error
    default-ubuntu-1604  Vagrant  ChefZero     Inspec    Ssh        Created      <None>
    ```


3. To destroy kitchen

  ```bash
  kitchen destroy
  ```
