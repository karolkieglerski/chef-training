# task3

Open terminal because all commands in that course you will run from that application. All quests will be from projet directory (`chef-course/chef-repo`) what we created in last task.

1. Generate cookbook

    ```bash
    chef generate cookbook cookbooks/weberver
    ```

2. Go to cookbook dir and see what it contains

    ```bash
    cookbooks/weberver/
    ├── Berksfile
    ├── LICENSE
    ├── README.md
    ├── chefignore
    ├── metadata.rb
    ├── recipes
    │   └── default.rb
    ├── spec
    │   ├── spec_helper.rb
    │   └── unit
    │       └── recipes
    │           └── default_spec.rb
    └── test
        └── integration
            └── default
                └── default_test.rb
    ```
