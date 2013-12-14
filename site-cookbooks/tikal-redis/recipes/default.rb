#
# Cookbook Name:: tikal-redis
# Recipe:: default
#
# Copyright 2013, Tikal-Kenso Ltd.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

apt_repository 'redis_ppa' do
  distribution node['lsb']['codename']
  components ['main']
  uri node['redis']['apt']['uri']
  key node['redis']['apt']['key']
  keyserver 'keyserver.ubuntu.com'
  action :add
end

package "redis-server" do
  version node['redis']['version']
  action :install
end
