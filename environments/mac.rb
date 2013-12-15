name 'mac'
description "Sets up a development workstation for coffeencoke on mac os x"

default_attributes(
  {
    bash_alias: {
      users: {
        matt: {
          alert: "terminal-notifier -title 'Command finished' -message 'Your command has finished running' -sender com.apple.Terminal",
          update_system: "brew update && brew upgrade",
        }
      }
    }
  }
)

