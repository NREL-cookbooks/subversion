#
# Cookbook Name:: subversion
# Recipe:: auto_checkin
#
# Copyright 2010, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ruby_enterprise"

ree_gem "svn_auto_checkin"
