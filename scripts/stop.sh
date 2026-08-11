#!/bin/bash
echo "Stopping old containers..."
docker stop ui 2>/dev/null || true
docker stop backend 2>/dev/null || true
docker stop proxy 2>/dev/null || true
docker rm ui 2>/dev/null || true
docker rm backend 2>/dev/null || true
docker rm proxy 2>/dev/null || true
echo "Old containers removed."