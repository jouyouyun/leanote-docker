#!/bin/bash

# test db 'leanote' whether exists
mongod --fork --syslog
if echo "show dbs" | mongo | grep --quiet "leanote"; then
    echo "Database already initialized"
else
    echo "Initialilze database"
    mongorestore -h localhost -d leanote --dir /opt/mongodb_backup
fi
mongod --shutdown

# enable authorization
mongod --auth
