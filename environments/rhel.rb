name 'rhel'
description "Sets up a development workstation for coffeencoke on Redhat Enterprise Linux"

default_attributes(
  {
    bash_aliases: {
      users: {
        matt: {
          update_system: "sudo bash -c 'yum -y update'",
        }
      }
    }
  }
)

