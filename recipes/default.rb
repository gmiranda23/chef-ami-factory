#
# Cookbook Name:: packer
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'nginx'

directory '/var/www/nginx-default' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  recursive true
  action :create
end

file '/var/www/nginx-default/index.html' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  content 'Hello World from the AWS Pop-up Loft!'
  action :create
end
