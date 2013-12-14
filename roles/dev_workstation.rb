name 'dev_workstation'
description "Sets up a development workstation for coffeencoke"
run_list 'recipe[bash_alias]'

default_attributes(
  {
    bash_alias: {
      users: {
        matt: {
          l: 'ls -lha',
          gst: 'git status'
        }
      }
    }
  }
)
