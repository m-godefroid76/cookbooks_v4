template '/mnt/srv/www/wordpress/current/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'root'
  group 'root'
  mode '0444'
end
