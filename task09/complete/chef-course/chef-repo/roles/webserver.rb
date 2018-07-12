name 'webserver'
description 'This is webseerver role to run cookbooks'

default_attributes()
override_attributes()

run_list  'recipe[example]',
          'recipe[weberver]'
