#!/bin/bash

# Function to download model files
download_model_files() {
    echo "Downloading model files..."
    python3 -m dfss --url=open@sophgo.com:/aigc/models.zip
}

# Wait for the file to be downloaded
while [ ! -f models.zip ]; do
    download_model_files
    echo "Waiting for the model files to be downloaded..."
    sleep 5 # Pause for 5 seconds before checking again
done

# Check and install unzip tool if not present
if ! command -v unzip &> /dev/null; then
    echo "unzip could not be found, installing..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Unzip model files
echo "Unzipping model files..."
unzip models.zip

# Check if the model file was unzipped successfully
if [ -f "models/rmbg.bmodel" ]; then
    echo "Bmodel ready."
else
    echo "Bmodel is not ready, check the unzip process."
    exit 1
fi

# Clean up temporary files
rm models.zip

echo "Environment ready, starting background removal!"