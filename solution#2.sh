#!/bin/bash

# Define the metadata URL and headers
metadata_url="http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true"
headers="Metadata-Flavor: Google"

# Make the request and store the response in a variable
metadata=$(curl -s "$metadata_url" -H "$headers")

# Print the metadata
echo "$metadata"
