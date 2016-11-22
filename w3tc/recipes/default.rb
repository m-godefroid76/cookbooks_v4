#
# Cookbook Name:: w3tc
# Recipe:: default
# encoding: utf-8
#
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

node[:deploy].each do |application, deploy|
  www_folder = "/srv/www/wordpress/current/wp-content/w3tc-config"
  execute "chown -R www-data:www-data #{www_folder}" do
  end
end

node[:deploy].each do |application, deploy|
  www_folder = "/srv/www/wordpress/current/wp-content/w3tc-config"
  execute "chmod -R 777 #{www_folder}" do
  end
end
