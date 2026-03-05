#!/bin/bash
# ============================================================
# refresh-docker-db.sh
# Run this BEFORE committing to Git whenever you add/update prompts.
# It re-dumps your local DB so the Docker image has the latest data.
#
# Usage:
#   chmod +x refresh-docker-db.sh   (first time only)
#   ./refresh-docker-db.sh
# ============================================================

echo "📦 Dumping current role_navigator database..."
pg_dump --no-owner --no-acl role_navigator > docker/init.sql

echo "✅ Done! docker/init.sql updated."
echo "   Commit both docker/init.sql and docker-compose.yml to Git."
echo "   Your teammate just needs to run: docker compose up -d"
