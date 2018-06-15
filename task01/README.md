# task1

Open terminal because all commands in that course you will run from that application.

1. Create directory of your project `chef-project`

    ```bash
    mkdir -p chef-project
    ```

2. In that directory create `Vagrantfile`

    ```bash
    cd chef-project
    vagrant init ubuntu/xenial64
    ```

    ubuntu/xenial64 - is box of ubuntu 16.04 LTS

3. Open Vagrant file and look how it looks like

    ```bash
    cat Vagrantfile
    ```

    Without additional comments it looks like bellow

    ```bash
    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    Vagrant.configure("2") do |config|
        config.vm.box = "ubuntu/xenial64"
    end
    ```

4. Run vagrant to start your VM

    ```bash
    vagrant up
    ```
