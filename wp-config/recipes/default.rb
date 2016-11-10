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
  owner 'deploy'
  group 'www-data'
  mode '0755'
  action :create
end
