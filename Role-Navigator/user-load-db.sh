#!/bin/bash
# user-load-db.sh
# For YOU (the Mac user with local Postgres).
# Run this after you 'git pull' your teammate's changes.
# It overwrites your local 'role_navigator' database with the contents of docker/init.sql.

DB_NAME="role_navigator"

echo "⚠️  This will OVERWRITE your local '$DB_NAME' database with the latest from Git."
read -p "Are you sure? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "📥 Loading latest data into local database..."
    # Drop and recreate to ensure a clean slate
    dropdb $DB_NAME 2>/dev/null
    createdb $DB_NAME
    psql $DB_NAME < docker/init.sql
    echo "✅ Success! Your local database is now in sync with the team."
else
    echo "Operation cancelled."
fi
