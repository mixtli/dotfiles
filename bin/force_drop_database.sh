#!/usr/bin/env bash

db_name=$1

PGPASSWORD=developer psql -h db96 -U postgres <<HERE
-- Connecting to the current user localhost's postgres instance

SELECT * from pg_database where datname = '$db_name';

UPDATE pg_database SET datallowconn = 'false' WHERE datname = '$db_name';
ALTER DATABASE $db_name CONNECTION LIMIT 1;
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '$db_name';
DROP DATABASE $db_name
HERE
