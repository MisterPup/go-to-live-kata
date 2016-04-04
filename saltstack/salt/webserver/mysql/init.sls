# install mysql server. Must run as a service at boot time
mysql:
  pkg.installed:
    - name: {{ pillar['mysql-pkg'] }}
  service.running:
    - name: {{ pillar['mysql-service'] }}
    - enable: True

# redhat distros need this two package in order to communicate with mysql
{% if grains['os_family'] == 'RedHat' %}
mysql-python:
 pkg.installed:
  - name: {{ pillar['mysql-python-pkg'] }}

mysql-connector-python:
 pkg.installed:
  - name: {{ pillar['mysql-connector-python-pkg'] }}
{% endif %}
