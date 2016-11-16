template '/var/www/.s3cfg' do
  source 's3cfg.erb'
  owner 'www-data'
  group 'www-data'
  mode '400'
end

template '/root/.s3cfg' do
  source 's3cfg.erb'
  owner 'root'
  group 'root'
  mode '0600'
end
