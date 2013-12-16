name 'base'
description "Sets up a base computer for coffeencoke"
run_list 'recipe[bash::aliases]', 'recipe[bash::colors]'

default_attributes(
  {
    bash_aliases: {
      users: {
        matt: {
          l: 'ls -lha',
          gst: 'git status',
          ls: "$LS_CMD",
          ll: "$LS_CMD -al",
          la: "$LS_CMD -A",
          l: "$LS_CMD -lahrtc",
          less: 'less -R',
          path: 'echo $PATH',
          so: 'source ~/.bashrc',
          cp: 'cp -v',
          mv: 'mv -v',
        }
      }
    }
  }
)

