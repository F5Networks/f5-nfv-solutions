#!/bin/bash

set -e

echo "Starting web server..."
nohup python -m SimpleHTTPServer ${port} > /dev/null 2>&1 &
