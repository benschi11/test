#!/bin/bash
# Build script for markitdown Docker container

set -e

echo "Building markitdown Docker container..."
docker build -t markitdown:latest .

echo ""
echo "Build completed successfully!"
echo ""
echo "Usage examples:"
echo "  docker run --rm markitdown:latest --help"
echo "  docker run --rm -i markitdown:latest < document.pdf > output.md"
echo "  docker run --rm -v \"\$(pwd)\":/data markitdown:latest /data/document.pdf -o /data/output.md"
echo ""