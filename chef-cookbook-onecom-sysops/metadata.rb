name 'onecom-sysops'
maintainer 'Rohit Ranjan'
maintainer_email 'rohitr@one.com'
license 'All Rights Reserved'
description 'Installs/Configures onecom-sysops'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
depends 'onecom-baseline'
depends 'onecom-timers'
depends 'onecom-nginx'
