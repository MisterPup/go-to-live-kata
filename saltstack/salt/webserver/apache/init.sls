configure apache:
  pkg.installed:
    - pkgs:
      - {{ pillar['apache'] }}
  service.running:
    - name: {{ pillar['apache'] }}
    - enable: True
