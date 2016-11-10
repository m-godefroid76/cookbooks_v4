template '/srv/www/wordpress/current/wp-content/themes/enfold-child/config.php' do
  source 'config.erb'
  owner 'deploy'
  group 'www-data'
  mode '0444'
end
