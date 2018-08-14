# Nagios demo webhook

This webhook keeps Farm and Server records updated in Nagios.


# Instance setup.
Execute "bootstrap.sh" on the target install

# Update the uwsgi.ini file with your settings

```ini
[uwsgi]
chdir = /opt/nagios-webhook
http-socket = 0.0.0.0:5018
wsgi-file = webhook.py
callable = app
workers = 1
master = true
plugin = python
env = SCALR_SIGNING_KEY=scalr_signing_key
env = SCALR_URL=https://demo.scalr.com
```

# Launch
execute 'relaunch.sh'
