#!/bin/bash
apt update
apt install -y python-pip python-dev python-pip uwsgi uwsgi-plugin-python

groupadd uwsgi
useradd -g uwsgi uwsgi

pip install -r /opt/nagios-webhook/requirements.txt

cp nagios-webhook.service /etc/systemd/system/

systemctl start nagios-webhook
systemctl enable nagios-webhook

#/usr/bin/uwsgi --ini /opt/nagios-webhook/uwsgi.ini --logto2 /var/log/nagios-webhook.log
