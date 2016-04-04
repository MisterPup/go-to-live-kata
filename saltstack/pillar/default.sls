# Common pillar values
db-mysql: mysql-server

# Os-specific pillar values 
{% if grains['os_family'] == 'RedHat' %}
apache: httpd
git: git
editor: vim-enhanced
{% elif grains['os_family'] == 'Debian' %}
apache: apache2
git: git-core
editor: vim
{% endif %}
