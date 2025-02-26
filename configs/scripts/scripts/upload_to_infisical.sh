#!/bin/bash

# Function to display help message
show_help() {
  cat <<EOF
Usage: $(basename "$0") <env_file_path> <environment>

Import environment variables from a .env file to Infisical.

Arguments:
    env_file_path    Path to the .env file containing the variables
    environment      Target environment in Infisical (e.g., dev, prod, staging)

Example:
    $(basename "$0") /path/to/.env production

Notes:
    - The .env file should contain variables in KEY=VALUE format
    - Empty lines and lines starting with # are ignored
    - Requires Infisical CLI to be installed and configured

EOF
}

# Check for help flag
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  show_help
  exit 0
fi

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
  echo "Error: Exactly two arguments are required"
  echo "Try '$(basename "$0") --help' for more information"
  exit 1
fi

# Path to your .env file from the first argument
ENV_FILE="$1"

# Environment from the second argument
ENV="$2"

# Check if the file exists
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: File not found: $ENV_FILE"
  exit 1
fi

# Check if the file is readable
if [ ! -r "$ENV_FILE" ]; then
  echo "Error: Cannot read file: $ENV_FILE"
  exit 1
fi

# Read each line in the .env file
while IFS= read -r line || [ -n "$line" ]; do
  # Skip empty lines and lines starting with '#'
  if [ -n "$line" ] && [ "${line:0:1}" != "#" ]; then
    # Split the line into key and value
    key=$(echo "$line" | cut -d= -f1)
    value=$(echo "$line" | cut -d= -f2-)

    # Strip quotes if value starts and ends with either '' or ""
    if [[ ($value == \"*\" || $value == \'*\') ]]; then
      # Remove the first and last character (quotes)
      value="${value:1:${#value}-2}"
    fi

    # Set the secret in Infisical with the potentially modified value
    infisical secrets set "$key=$value" --env "$ENV"
  fi
done <"$ENV_FILE"

echo "Successfully processed $ENV_FILE for environment $ENV"
