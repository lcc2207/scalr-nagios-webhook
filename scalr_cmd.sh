#!/bin/bash

echo "$1"
echo "$2"
echo "$3"

nagiospath="/etc/nagios3/conf.d"

removehost()
{
   echo "removing host $nagiospath/$1.cfg"
   rm -rf $nagiospath/$1.cfg
   echo $?
   reload
}


addhost()
{
  echo "Adding host"
  cat <<EOF > $nagiospath/$1.cfg
  define host {
   use         server
   host_name   $1
   hostgroups  linux
   address     $2
  }
EOF
reload
}

reload()
{
echo "relaoding nagios"
service nagios3 reload
}

if [ $3 = "HostUp" ]; then
  addhost $1 $2
elif [ $3 = "HostDown" ]; then
  removehost $1
fi
