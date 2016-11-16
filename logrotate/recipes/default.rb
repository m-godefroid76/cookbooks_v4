template '/etc/logrotate.conf' do
  source 'logrotate.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/logrotate.d/apache2' do
  source 'apache2.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

bash "copy logrotate.cron from daily to hourly" do
  user 'root'
  code <<-EOH
  sudo cp /etc/cron.daily/logrotate /etc/cron.hourly/logrotate
  EOH
end
