# install apache httd. Must run as a service at boot time
apache:
  pkg.installed:
    - name: {{ pillar['apache'] }}
  service.running:
    - name: {{ pillar['apache'] }}
    - enable: True
