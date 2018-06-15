# Requirements

1. Install xcode

    ```bash
    xcode-select --install
    ```

2. Install homebrew and cask

    ```bash
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/cask
    ```

3. Install rbenv

    ```bash
    brew install rbenv
    rbenv init
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    source ~/.bash_profile
    rbenv install 2.4.1
    rbenv global 2.4.1
    ```

4. Install chef and chef-zero

    ```bash
    brew cask install chef/chef/chefdk
    sudo gem install chef-zero
    chef gem install knife-zero
    ```
