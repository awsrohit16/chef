include_recipe 'onecom-nginx::default'

node.default['nginx']['http_options']['ssl_protocols']['value'] = 'TLSv1 TLSv1.1 TLSv1.2'
node.default['nginx']['http_options']['ssl_prefer_server_ciphers']['value'] = 'on'
node.default['nginx']['http_options']['error_log'] = '/var/log/nginx/error.log;'
node.default['nginx']['http_options']['gzip_http_version']	= {'disabled' => true }
node.default['nginx']['http_options']['gzip_comp_level']	= {'disabled' => true }
node.default['nginx']['http_options']['gzip_proxied']	        = {'disabled' => true }
node.default['nginx']['http_options']['gzip_vary']	        = {'disabled' => true }
node.default['nginx']['http_options']['gzip_types']	        = {'disabled' => true }
node.default['nginx']['http_options']['gzip_min_length']	= {'disabled' => true }



template '/etc/nginx/sites-available/default' do
       source 'default.erb'
       owner 'root'
       group 'root'
       mode  0644
       notifies :reload, 'service[nginx]', :delayed
end  


include_recipe 'onecom-timers::default'

node.default['onecom']['timers']['jobs']['metrics-poll'] = {
  'calendar'    => '*:*:0/30',
  'accuracy'    => '10m'
  'persistent'  => 'true'
  'command' => '/usr/local/bin/get-metrics-data-webpods.pl',
}

node.default['onecom']['timers']['jobs']['abuse-notify-summary'] = {
  'calendar'    => '*-*-1,15 08:00:00',
  'accuracy'    => '10m'
  'persistent'  => 'true'
  'command' => '/usr/local/bin/opsutils-watch-report POST sendnotifysummary/systems/15',
}

node.default['onecom']['timers']['jobs']['watchreport-ops-day'] = {
  'calendar'    => '10,17:00',
  'accuracy'    => '10m'
  'command' => '/usr/local/bin/opsutils-watch-report POST sendmail/ops-in/7.5',
}

node.default['onecom']['timers']['jobs']['watchreport-systems'] = {
  'calendar'    => '16:30',
  'accuracy'    => '10m'
  'command' => '/usr/local/bin/opsutils-watch-report POST sendmail/systems/24',
}

node.default['onecom']['timers']['jobs']['watchreport-secondlvl'] = {
  'calendar'    => '05:30',
  'accuracy'    => '10m'
  'command' => '/usr/local/bin/opsutils-watch-report POST sendmail/2ndlevel/24',
}

node.default['onecom']['timers']['jobs']['watchreport-ops-night'] = {
  'calendar'    => '02:00',
  'accuracy'    => '10m'
  'command' => '/usr/local/bin/opsutils-watch-report POST sendmail/ops-in/9',
}

