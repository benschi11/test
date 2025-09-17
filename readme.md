# Markitdown Docker Container

This repository contains a Dockerfile to build a container with the [markitdown](https://github.com/microsoft/markitdown) application by Microsoft. 

MarkItDown is a utility for converting various files to Markdown for use with LLMs and text analysis pipelines.

## Supported File Formats

- PDF files
- PowerPoint presentations (PPTX)
- Word documents (DOCX)
- Excel files (XLSX, XLS)
- Images with EXIF metadata and OCR
- Audio files with speech transcription
- HTML files
- Text-based formats (CSV, JSON, XML)
- ZIP archives (iterates over contents)
- YouTube URLs
- EPub files
- And more!

## Quick Start

### Method 1: Using the build script
```bash
./build.sh
```

### Method 2: Manual build
```bash
docker build -t markitdown:latest .
```

### Method 3: Using Docker Compose
```bash
docker-compose build
```

## Usage Examples

### Convert a file using stdin/stdout
```bash
docker run --rm -i markitdown:latest < document.pdf > output.md
```

### Convert a file with volume mounting
```bash
docker run --rm -v "$(pwd)":/data markitdown:latest /data/document.pdf -o /data/output.md
```

### Get help
```bash
docker run --rm markitdown:latest --help
```

### Using Docker Compose for batch processing
```bash
# Convert a specific file
docker-compose run --rm convert /data/document.pdf -o /data/output.md

# Or modify the docker-compose.yml command for your needs
```

## Testing

Run the test script to verify everything works:
```bash
./test-docker.sh
```

## Container Features

- **Base Image**: Python 3.11 slim (reliable and well-tested)
- **Security**: Runs as non-root user (UID/GID 1000)
- **Complete Installation**: Includes all optional dependencies via `markitdown[all]`
- **Media Support**: Includes ffmpeg and exiftool for audio/video/image processing
- **SSL Compatibility**: Configured to handle SSL certificate issues in corporate environments

## File Structure

```
.
├── Dockerfile          # Main container definition
├── .dockerignore       # Files to exclude from build context
├── docker-compose.yml  # Docker Compose configuration
├── build.sh           # Build script
├── test-docker.sh     # Test script
├── readme.md          # This file
└── test.md            # Sample test file
```

## Troubleshooting

### Network/SSL Issues
If you encounter SSL certificate errors during build, this is often due to corporate proxies or network restrictions. The Dockerfile includes trusted host configurations to handle common issues.

### Permission Issues
The container runs as user ID 1000 by default. If you need different permissions, rebuild with:
```bash
docker build --build-arg USERID=$(id -u) --build-arg GROUPID=$(id -g) -t markitdown:latest .
```

## Original Project

This is a containerized version of Microsoft's markitdown tool. For more information about the original project, visit:
- **GitHub**: https://github.com/microsoft/markitdown
- **PyPI**: https://pypi.org/project/markitdown/

## Contributing

Feel free to submit issues and enhancement requests!
