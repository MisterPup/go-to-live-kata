# install and configure wordpress
wordpress:
  require:
    - sls: webserver.mysql
  mysql_database.present:
    - name: {{ salt['pillar.get']('mysql-conf:name') }}
  mysql_user.present:
    - name: {{ salt['pillar.get']('mysql-conf:user') }}
    - password: {{ salt['pillar.get']('mysql-conf:password') }}
  mysql_grants.present:
    - database: {{ salt['pillar.get']('mysql-conf:name') }}.*
    - grant: ALL PRIVILEGES
    - user: {{ salt['pillar.get']('mysql-conf:user') }}
    - host: {{ salt['pillar.get']('mysql-conf:host') }}

# We need to restart httpd in order to apply php changes in centos
restart_apache:
  module.run:
    - name: service.restart
    - m_name: {{ pillar['apache'] }}  # m_name gets passed to the execution module as "name"

# Download the latest wordpress edition, uncompress it and delete the archive
get_wordpress:
 cmd.run:
  - name: 'wget http://wordpress.org/latest.tar.gz && tar xvzf latest.tar.gz && rm -rf latest.tar.gz'
  - cwd: /var/www/html/
#  - unless: ls /var/www/html/wordpress #don't download latest version if wordpress is already installed

# Download and make executable wp-cli archive
get_wp-cli:
 cmd.run:
  - name: 'curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar'
  - cwd: /tmp
#  - unless: ls /usr/local/bin/wp-cli

# install wp-cli to /usr/local/bin
install_wp-cli:
 cmd.run:
  - name: 'sudo mv wp-cli.phar /usr/local/bin/wp-cli'
  - cwd: /tmp
#  - unless: ls /usr/local/bin/wp-cli

# Tell wp-cli to create wp-config.php
config_wordpress:
 cmd.run:
  - cwd: /var/www/html/wordpress/
  - name: '/usr/local/bin/wp-cli core config --dbname={{ salt['pillar.get']('mysql-conf:name') }} --dbuser={{ salt['pillar.get']('mysql-conf:user') }} --dbpass={{ salt['pillar.get']('mysql-conf:password') }} --allow-root'
  - unless: ls /var/www/html/wordpress/wp-config.php

# Tell wp-cli to install wordpress
install_wordpress:
 cmd.run:
  - cwd: /var/www/html/wordpress/
  - name: '/usr/local/bin/wp-cli core install --url=http://{{ salt['pillar.get']('minion:ip') }}/wordpress --title={{ salt['pillar.get']('wp-conf:title') }} --admin_user={{ salt['pillar.get']('wp-conf:admin_user') }} --admin_password={{ salt['pillar.get']('wp-conf:admin_password') }} --admin_email={{ salt['pillar.get']('wp-conf:admin_email') }} --allow-root'
#  - unless: ls /var/www/html/wordpress/
