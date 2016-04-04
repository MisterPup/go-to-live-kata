# configure php modules for wordpress
php:
  pkg.installed:
    - pkgs:
      {% if grains['os_family'] == 'Debian' %}
      - {{ pillar['php-pkg'] }}
      - {{ pillar['php-mysql-pkg'] }}
      - {{ pillar['libapache2-mod-php-pkg'] }}
      - {{ pillar['php-mcrypt-pkg'] }}
      - {{ pillar['php-gd-pkg'] }}
      - {{ pillar['libssh2-php-pkg'] }}
      {% elif grains['os_family'] == 'RedHat' %}
      - {{ pillar['php-pkg'] }}
      - {{ pillar['php-mysql-pkg'] }}
      {% endif %}
    - require:
      - pkg: {{ pillar['apache'] }}
      - pkg: {{ pillar['mysql-pkg'] }}
