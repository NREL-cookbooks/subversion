#
# Cookbook Name:: subversion
# Recipe:: checkout_private_key
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ssh_known_hosts"

# Use a private key to checkout stuff from our subversion server in recipes
# over svn+ssh.
#
# This private key approach is needed for Vagrant where password prompts won't
# work at all. 
template "#{Chef::Config[:file_cache_path]}/subversion_chef_checkout.key" do
  source "checkout_private_key.erb"
  owner "root"
  group(node[:common_writable_group] || "root")
  mode 0600
end

ENV["SVN_SSH"] = "ssh -i #{Chef::Config[:file_cache_path]}/subversion_chef_checkout.key"
