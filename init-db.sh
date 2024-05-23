#!/bin/bash
set -e

# Run custom SQL commands
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE example (id SERIAL PRIMARY KEY, data VARCHAR(100));
EOSQL
