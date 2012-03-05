#
# Cookbook Name:: subversion
# Recipe:: collabnet_client
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

arch = (node[:kernel][:machine] == "x86_64") ? "x86_64" : "i386"
rpm = "CollabNetSubversion-client-1.7.3-2.#{arch}.rpm"

cookbook_file "#{Chef::Config[:file_cache_path]}/#{rpm}" do
  backup false
end

package "CollabNetSubversion-client" do
  source "#{Chef::Config[:file_cache_path]}/#{rpm}"
  options "--nogpgcheck" 
end

template "/etc/profile.d/collabnet_subversion.sh" do
  source "collabnet_profile.sh.erb"
  mode "0644"
  owner "root"
  group "root"
end
