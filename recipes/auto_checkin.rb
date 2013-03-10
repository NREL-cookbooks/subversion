#
# Cookbook Name:: subversion
# Recipe:: auto_checkin
#
# Copyright 2010, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::system"

rbenv_gem "svn_auto_checkin" do
  source "http://gems.cttsdev.nrel.gov"
end
