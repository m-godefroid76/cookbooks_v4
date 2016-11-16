node[:deploy].each do |app, deploy|
  file File.join(deploy[:deploy_to], 'shared', 'config', 'app_data.yml') do
    content YAML.dump(node[:my_app_data][app].to_hash)
  end
end

cron "wp-cron" do
    action :create
    minute "*/10"
    command '/usr/bin/php /srv/www/wordpress/current/wp-cron-mu.php > /var/log/cron.log 1>&1'
end

cron "cronreviews" do
    minute "*/5"
    command 'curl http://\'#{node[:deploy]['DOMAIN_NAME']}\'/wp-content/plugins/cron_reviews/cron.php > /var/log/cron.log 1>&1'
end

# cron "logrotate" do
#     action :create
#     minute "0"
#     hour '3'
#     command '/usr/sbin/logrotate /etc/logrotate.conf > /var/log/cron.log 1>&1'
# end

# cron "backup-db" do
#     action :create
#     minute '0'
#     hour '2'
#     weekday "1"
#     command '/scripts/backup-db.sh > /var/log/cron.log 1>&1'
# end
