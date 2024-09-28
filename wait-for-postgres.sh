#!/bin/sh

set -e

host="$1"
shift
cmd="$@"

until PGPASSWORD="Extreme123" psql -h "$host" -U "postgres" -c '\q'; do
  echo "PostgreSQL is unavailable - sleeping" >&2
  sleep 1
done

echo "PostgreSQL is up - executing command" >&2

# Executar o comando usando 'exec' para substituir o processo atual
exec $cmd