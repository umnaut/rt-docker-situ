#!/bin/bash
# Starts database service, initializes rt database, then brings up everything else
# Only needs to be run once, or if /var/lib/apps/rt/db-data is cleared out
docker compose up db -d
docker compose run --rm rt bash -c 'cd /opt/rt5 && perl ./sbin/rt-setup-database --action init --skip-create'
docker compose up -d
