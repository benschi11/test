#!/bin/bash
# Test script for markitdown Docker container

set -e

echo "Testing markitdown Docker container..."

# Build the container
echo "Step 1: Building the container..."
docker build -t markitdown:test .

# Test the help command
echo "Step 2: Testing help command..."
docker run --rm markitdown:test --help

# Test with sample file
echo "Step 3: Creating sample file..."
echo "Hello World! This is a test." > test-input.txt

echo "Step 4: Testing file conversion..."
docker run --rm -v "$(pwd)":/data markitdown:test /data/test-input.txt -o /data/test-output.md

if [ -f test-output.md ]; then
    echo "✅ Success! Conversion test passed."
    echo "Output:"
    cat test-output.md
    rm test-input.txt test-output.md
else
    echo "❌ Error: Conversion test failed."
    exit 1
fi

echo ""
echo "🎉 All tests passed! The markitdown container is working correctly."