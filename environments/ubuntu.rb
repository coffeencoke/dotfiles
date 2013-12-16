name 'ubuntu'
description "Sets up a development workstation for coffeencoke on ubuntu"

default_attributes(
  {
    bash_aliases: {
      users: {
        matt: {
          update_system: "sudo bash -c 'apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove'",
        }
      }
    }
  }
)

