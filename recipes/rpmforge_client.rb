#
# Cookbook Name:: subversion
# Recipe:: rpmforge_client
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::rpmforge"

packages = %w{subversion subversion-devel subversion-perl}
packages.each do |package_name|
  # FIXME? yum_package doesn't currently work when passing the --enablerepo
  # option, since other internal checks that look for packages don't also use
  # this option, so it ends up using the default subversion package, not the
  # one from rpmforge.
  #
  # yum_package package_name do
  #   options "--enablerepo=rpmforge-extras"
  #   flush_cache [:before, :after]
  #   action :install
  # end

  execute "yum install #{package_name}" do
    command "yum -d0 -e0 -y --enablerepo=rpmforge-extras install #{package_name}"
    not_if "rpm -qa | grep -q '^#{package_name}'"
  end
end
