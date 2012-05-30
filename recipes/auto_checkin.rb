#
# Cookbook Name:: subversion
# Recipe:: auto_checkin
#
# Copyright 2010, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::global_version"

rbenv_gem "svn_auto_checkin" do
  ruby_version node[:rbenv][:install_global_version]
  options "--source 'http://gems.cttsdev.nrel.gov'"
end
