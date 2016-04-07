# Common pillar values

# mysql
mysql-pkg: mysql-server
mysql-conf:
  name: wordpress
  password: password
  user: wordpress
  host: localhost
mysql-python-pkg: MySQL-python
mysql-connector-python-pkg: mysql-connector-python

# wordpress
wp-conf:
  title: development
  admin_user: admin
  admin_password: password
  admin_email: c.pupparo@prova.com
  wp-folder-owner: wordpress
  wp-folder-owner-fullname: Wordpress

#php5-mysql php5 libapache2-mod-php5 php5-mcrypt php5-gd libssh2-php

# Os-specific pillar values
{% if grains['os_family'] == 'Debian' %}

apache: apache2
apache-user: www-data
git: git-core
editor: vim
mysql-service: mysql

# php
php-pkg: php5
php-mysql-pkg: php5-mysql
libapache2-mod-php-pkg: libapache2-mod-php5
php-mcrypt-pkg: php5-mcrypt
php-gd-pkg: php5-gd
libssh2-php-pkg: libssh2-php

{% elif grains['os_family'] == 'RedHat' %}

apache: httpd
apache-user: apache
git: git
editor: vim-enhanced
mysql-service: mysqld

#php
php-pkg: php
php-mysql-pkg: php-mysql

{% endif %}
