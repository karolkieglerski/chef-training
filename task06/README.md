# task6

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

In this task you don't find `complite` directory because it is the same like in task5.

---

1. Run chef-zero

    ```bash
    chef-zero -d
    ```

2. Rename `knife.rb` file

    ```bash
    mv knife.rb knife.rb_back
    ```

3. Load data to chef-zero

    ```bash
    knife upload cookbooks
    knife upload environments
    knife upload roles
    knife upload nodes
    ```

    Show data i chef server
    ```bash
    knife cookbook list
    knife environment list
    knife role list
    knife node list
    ```

4. Run bootstrap with chef

    ```bash
    knife bootstrap 192.168.33.10 --ssh-user vagrant --node-name development-server --sudo
    ```
    Why it not working?

5. Install chef-zero on virtual machine

    Run on virtual machine
    ```bash
    sudo apt-get update
    sudo apt-get install chef-zero
    ```

6. Run chef-zero and bootstrap another one

    Run on virtual machine
    ```bash
    chef-zero -d
    ```

    Run on your workstation
    ```bash
    knife bootstrap 192.168.33.10 --ssh-user vagrant --node-name development-server --sudo
    ```
