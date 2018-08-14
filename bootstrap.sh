#!/bin/bash
apt update
apt install -y python-pip python-dev python-pip uwsgi uwsgi-plugin-python

groupadd uwsgi
useradd -g uwsgi uwsgi

pip install -r /opt/nagios-webhook/requirements.txt

/usr/bin/uwsgi --ini /opt/nagios-webhook/uwsgi.ini
