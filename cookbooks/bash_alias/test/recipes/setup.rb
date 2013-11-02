include_recipe 'user'

node.bash_alias.users.each do |username, aliases|
  Chef::Log.info "Creating user: #{username}"
  user_account username
end
