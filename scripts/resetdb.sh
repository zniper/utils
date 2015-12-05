#!/bin/bash
if [ -z "$2" ]; then
    echo 'Missing aguments: resetdb.sh <database-name> <user-name>' 
    exit 1
fi
sudo su - postgres -c "dropdb $1"
echo "DB dropped"
sudo su - postgres -c "createdb $1"
echo "DB created"
sudo su - postgres -c "psql -c 'grant all privileges on database $1 to $2;'"
if [ ! -z "$3" ]; then
    echo "Now importing from script"
    psql -d $1 -U $2 -W < $3
fi
exit 1
