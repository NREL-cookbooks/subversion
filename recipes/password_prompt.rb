#
# Cookbook Name:: subversion
# Recipe:: password_prompt
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

# Prompt for a password prompt during load and store it in a global variable
# for re-use in other recipe's checking out from subversion.
#
# Note: This type of prompt doesn't seem to work with Vagrant's provisioning
# where there's no TTY in the session used. So for vagrant see
# checkout_private_key.
if(!::File.directory?(node[:db_config][:path]))
  chef_gem "highline"
  require "highline/import"

  $svn_username ||= ask("SVN Username: ")
  $svn_password ||= ask("SVN Password: ") { |q| q.echo = false }
end
