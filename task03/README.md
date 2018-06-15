# task3

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Destroy your virtual machine

    ```bash
    cd ../
    vagrant destory
    ```
2. Add private network to VM

    ```bash
    ...
    config.vm.network :private_network, ip: "192.168.33.10"
    ...
    ```

3. Enable ssh agent forwoard

    ```bash
    config.ssh.forward_agent = true
    ```

4. Copy your public key to authorized_keys and install required language pack

    ```bash
    ...
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "$HOME/keys/id_rsa.pub"
    config.vm.provision "shell", inline: <<-SHELL
        cat /home/vagrant/keys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
        apt-get update
        apt-get install -y language-pack-en
        touch /var/lib/cloud/instance/locale-check.skip
    SHELL
    ...
    ```
5. Run virtual machine and check if you have connection over ssh

    ```bash
    vagrant up
    ssh vagrant@192.168.33.10
    ```

    If connection working disconnect the VM.

6. Configure knife-zero

    ```bash
    cd chef-repo/

    cat <<EOT > ./knife.rb
    local_mode true
    chef_repo_path   File.expand_path('../' , __FILE__)

    knife[:ssh_attribute] = "knife_zero.host"
    knife[:use_sudo] = true

    ## use specific key file to connect server instead of ssh_agent(use ssh_agent is set true by default).
    # knife[:identity_file] = "~/.ssh/id_rsa"

    ## Attributes of node objects will be saved to json file.
    ## the automatic_attribute_whitelist option limits the attributes to be saved.
    knife[:automatic_attribute_whitelist] = %w[
    fqdn
    os
    os_version
    hostname
    ipaddress
    roles
    recipes
    ipaddress
    platform
    platform_version
    cloud
    cloud_v2
    chef_packages
    ]
    EOT

7. Create chef environments

    ```bash
    knife environment create development --disable-editing
    knife environment create production --disable-editing
    ```

8. Bootstrapp VM

    ```bash
    knife zero bootstrap 192.168.33.10 --ssh-user vagrant --node-name development-server
    ```

9. Add VM to deployment group

    ```bash
    knife node environment set development-server development
    ```
