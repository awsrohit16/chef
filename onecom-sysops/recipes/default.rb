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



cookbook_file '/etc/nginx/sites-available/default' do
  source 'default'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :reload, 'service[nginx]', :delayed
end

