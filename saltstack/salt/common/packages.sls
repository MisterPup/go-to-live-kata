# list of common packages that should be installed in every minion
common_packages:
  pkg.installed:
    - pkgs:
      - {{ pillar['editor'] }}
