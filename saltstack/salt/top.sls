base:
  '*':
    - common
  'roles:webserver':
    - match: grain
    - webserver
