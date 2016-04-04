# Common pillar values
mysql-pkg: mysql-server
mysql-conf:
    name: wordpress
    password: password
    user: wordpress
    host: localhost
mysql-python-pkg: MySQL-python
mysql-connector-python-pkg: mysql-connector-python

# Os-specific pillar values
{% if grains['os_family'] == 'Debian' %}
apache: apache2
git: git-core
editor: vim
mysql-service: mysql
{% elif grains['os_family'] == 'RedHat' %}
apache: httpd
git: git
editor: vim-enhanced
mysql-service: mysqld
{% endif %}
