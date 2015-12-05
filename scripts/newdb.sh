#! /bin/bash
if [ -z "$1" ]; then
    echo "Syntax: newdb.sh <database-name> <user-name> [data-directory]"
    exit 1
fi

if [ -z "$3" ]; then
    data="/var/lib/pgsql/data"
else
    data=$3
fi

sudo su - postgres -c "createdb $1"
echo "DB created"
sudo su - postgres -c "createuser -P $2"
echo "Role created"
sudo su - postgres -c "psql -c 'GRANT ALL PRIVILEGES ON DATABASE $1 TO $2;'"
sudo su - postgres -c "psql -c 'ALTER ROLE $2 WITH LOGIN;'"
sudo su -c "sed -i -e '1ilocal	$1	all	md5\' $data/pg_hba.conf"
sudo service postgresql restart
echo "New DB is ready"
exit 0
