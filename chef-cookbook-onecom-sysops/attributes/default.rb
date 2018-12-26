default['nginx']['ssl_protocols']         = 'TLSv1 TLSv1.2'
default['nginx']['ssl_certificate_key']   = '/etc/one.com/ssl/wildcard_one_com.key'
default['nginx']['ssl_certificate']       = '/etc/one.com/ssl/wildcard_one_com.crt'
default['nginx']['ssl_cipers']            = 'HIGH:RC4+RSA:!aNULL:!MD5:!kEDH:!3DES'
default['nginx']['ssl_dhparam']           = '/etc/ssl/certs/dhparam.pem'
default['nginx']['client_max_body_size']  = '32M'

