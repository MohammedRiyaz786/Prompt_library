#!/bin/bash
# teammate-save-db.sh
# For the teammate using Docker on Windows/Mac.
# This script dumps their Docker database into the shared docker/init.sql file.

echo "📦 Exporting database from Docker container..."
docker exec -t role_navigator_db pg_dump -U postgres --no-owner --no-acl role_navigator > docker/init.sql

echo "✅ Done! docker/init.sql has been updated with your changes."
echo "   Now you can 'git add docker/init.sql', commit, and push."
