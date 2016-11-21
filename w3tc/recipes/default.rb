#
# Cookbook Name:: w3tc
# Recipe:: default
# encoding: utf-8
#
directory '/srv/www/wordpress/current/wp-content/cache/w3tc-config' do
  owner 'www-data'
  group 'www-data'
  mode '0777'
  action :create
end

template '/srv/www/wordpress/current/wp-content/w3tc-config/master.json' do
  source 'master.json.erb'
  owner 'www-data'
  group 'www-data'
  mode '0777'
end

template '/srv/www/wordpress/current/wp-content/w3tc-config/index.html' do
  source 'index.html.erb'
  owner 'www-data'
  group 'www-data'
  mode '0777'
end
