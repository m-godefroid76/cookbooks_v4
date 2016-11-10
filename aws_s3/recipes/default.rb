#
# Cookbook Name:: symlink
# Recipe:: default
# encoding: utf-8
#

# template '/root/.s3cfg' do
#   source 's3cfg.erb'
#   owner 'root'
#   group 'root'
#   mode '0600'
# end


# directory '/root/.aws' do
  # owner 'root'
  # group 'root'
  # mode '0755'
  # action :create
# end
#
# template '/root/.aws/config' do
  # source 'config.erb'
  # owner 'root'
  # group 'root'
  # mode '400'
# end

directory '/var/www/.aws' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

template '/var/www/.aws/config' do
  source 'config.erb'
  owner 'www-data'
  group 'www-data'
  mode '400'
end
#
# bash "download enfold.css from s3" do
#   user 'root'
#   code <<-EOH
#   aws s3 cp s3://#{ node[:bucket] }/wp-content/uploads/ /srv/www/wordpress/current/wp-content/uploads/ --recursive  --exclude "*"  --include "*enfold.css"
#   EOH
# end

#
# node[:deploy].each do |application, deploy|
#   www_folder = "/var/www"
#   execute "chown -R www-data:www-data #{www_folder}" do
#   end
# end

%w{ awscli }.each do |pkg|
  package pkg
end

# template '/etc/sudoers' do
  # source 'sudoers.erb'
  # owner 'root'
  # group 'root'
  # mode '0440'
# end

service "apache2" do
  action :restart
end
