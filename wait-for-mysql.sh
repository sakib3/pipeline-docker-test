#!/bin/bash
# wait-for-mysql.sh

set -e
set -x

host="$1"
shift
cmd="$@"

until mysql -h "$host" -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} -e 'select 1'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "Mysql is up - executing command"
exec $cmd
