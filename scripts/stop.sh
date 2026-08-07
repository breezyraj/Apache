#!/bin/bash
echo "Stopping old containers..."
docker stop app1 2>/dev/null
docker stop app2 2>/dev/null
docker rm app1 2>/dev/null
docker rm app2 2>/dev/null
echo "Old containers removed."