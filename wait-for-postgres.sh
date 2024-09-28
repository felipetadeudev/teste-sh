#!/bin/bash

set -e

host="$1"
shift
cmd="$@"

until PGPASSWORD="Extreme123" psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "PostgreSQL is up - executing command"
exec $cmd