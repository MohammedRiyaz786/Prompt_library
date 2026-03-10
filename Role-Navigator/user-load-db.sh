#!/bin/bash
# user-load-db.sh
# For YOU (the Mac user with local Postgres).
# Run this after you 'git pull' your teammate's changes.
# It overwrites your local 'role_navigator' database with the contents of docker/init.sql.

DB_NAME="role_navigator"

echo "⚠️  This will RESET your Docker database '$DB_NAME' with the latest from docker/init.sql."
read -p "Are you sure? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "📥 Refreshing Docker container with latest data..."
    docker compose down -v
    docker compose up -d
    echo "✅ Success! Your Docker database is now in sync with the team."
else
    echo "Operation cancelled."
fi
