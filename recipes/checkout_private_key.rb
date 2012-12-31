#
# Cookbook Name:: subversion
# Recipe:: checkout_private_key
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ssh_known_hosts"

# FIXME: Use a private key to checkout stuff from our subversion server in
# recipes over svn+ssh. This is my personal private key which woudln't be good
# to be used for shared purposes like this, but svn+ssh on cttssvn is actually
# somewhat broken and is only read-only, so the private key doesn't matter as
# much. However, we should still really get an explicit read-only user for this
# purprose.
#
# This private key approach is needed for Varnish where password prompts won't
# work at all. 
cookbook_file "#{Chef::Config[:file_cache_path]}/cttssvn-nmuerdte-chef-readonly.key" do
  owner "root"
  group(node[:common_writable_group] || "root")
  mode 0600
end

ENV["SVN_SSH"] = "ssh -i #{Chef::Config[:file_cache_path]}/cttssvn-nmuerdte-chef-readonly.key"
