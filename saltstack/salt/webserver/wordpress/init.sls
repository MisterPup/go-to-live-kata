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
