# Use Python 3.11 as it has better compatibility and fewer SSL issues  
FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV EXIFTOOL_PATH=/usr/bin/exiftool
ENV FFMPEG_PATH=/usr/bin/ffmpeg
ENV PIP_TRUSTED_HOST=pypi.org
ENV PIP_TRUSTED_HOST=files.pythonhosted.org

# Install system dependencies for media processing
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libimage-exiftool-perl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install markitdown with all optional dependencies from PyPI
# Use --trusted-host flags to handle SSL issues in build environments
RUN pip --no-cache-dir install --trusted-host pypi.org --trusted-host files.pythonhosted.org 'markitdown[all]'

# Create non-root user for security
ARG USERID=1000
ARG GROUPID=1000
RUN groupadd -g $GROUPID markitdown && \
    useradd -u $USERID -g $GROUPID -m markitdown

USER markitdown

ENTRYPOINT [ "markitdown" ]