#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Current directory: $(pwd)"
echo "Listing directory contents:"
ls -la

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Verifying installation..."
pip list

echo "Downloading NLTK data..."
python -c "
import nltk
import ssl

try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    pass
else:
    ssl._create_default_https_context = _create_unverified_https_context

nltk.download('punkt')
nltk.download('wordnet')
nltk.download('averaged_perceptron_tagger')
nltk.download('stopwords')
"

echo "Verifying Python environment..."
python --version
which python

echo "Build completed successfully!" 