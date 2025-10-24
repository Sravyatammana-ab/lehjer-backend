#!/bin/bash
# Build script for Render deployment
set -e

echo "Python version:"
python --version

echo "Pip version:"
pip --version

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Build completed successfully!"
