# install apache httd. Must run as a service at boot time
apache:
  pkg.installed:
    - pkgs:
      - {{ pillar['apache'] }}
  service.running:
    - name: {{ pillar['apache'] }}
    - enable: True
