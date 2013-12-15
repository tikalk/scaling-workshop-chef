#
# Cookbook Name:: tikal-solr
# Recipe:: default
#
# Copyright 2013, Tikal-Kenso Ltd.
#
# All rights reserved - Do Not Redistribute
#
#
include_recipe "hipsnip-solr"

template "#{node['solr']['home']}/conf/schema.xml" do
  source "schema.xml.erb"
  owner node["jetty"]["user"]
  group node["jetty"]["group"]
  mode '644'
end
