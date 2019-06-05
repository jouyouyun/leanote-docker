#!/bin/bash

# test db 'leanote' whether exists
mongod --fork --syslog
if echo "show dbs" | mongo | grep --quiet "leanote"; then
	echo "Database already initialized"
else
	echo "Initialilze database"
	mongorestore -h localhost -d leanote --dir /data/mongodb_init
fi
mongod --shutdown

# enable authorization
declare ARGS
if [ ! -z $ENABLE_AUTH ]; then
	ARGS="--auth"
fi

mongod ${ARGS} --bind_ip 0.0.0.0
