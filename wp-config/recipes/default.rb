template '/mnt/srv/www/wordpress/current/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'root'
  group 'root'
  mode '0444'
end

template '/srv/www/wordpress/current/.htaccess' do
  source 'htaccess.erb'
  owner 'root'
  group 'root'
  mode '0444'
end

directory '/srv/www/wordpress/current/wp-content/uploads' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

directory '/srv/www/wordpress/current/wp-content/cache' do
  owner 'www-data'
  group 'www-data'
  mode '0777'
  action :create
end

directory '/srv/www/wordpress/current/wp-content/themes/altair/cache' do
  owner 'www-data'
  group 'www-data'
  mode '0777'
  action :create
end

# directory '/srv/www/wordpress/current/wp-content/cache/w3tc-config' do
#   owner 'www-data'
#   group 'www-data'
#   mode '0777'
#   action :create
# end

template '/srv/www/wordpress/current/wp-cron-mu.php' do
  source 'wp-cron-mu.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/srv/www/wordpress/current/wp-content/wflogs' do
  owner 'www-data'
  group 'www-data'
  mode '0777'
  action :create
end

node[:deploy].each do |application, deploy|
  www_folder = "/srv/www/wordpress/current/wp-content/wflogs"
  execute "chown -R www-data:www-data #{www_folder}" do
  end
end
