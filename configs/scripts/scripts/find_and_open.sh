#!/bin/bash

# Function to display usage information
usage() {
	echo "Usage: $0 SEARCH_TERM [OPEN_PROGRAM] [--folder=SEARCH_FOLDER]"
	echo "SEARCH_TERM: The term to search for."
	echo "OPEN_PROGRAM: The program to open the file with. Default is batcat, bat, or cat."
	echo "SEARCH_FOLDER: The folder to search in. Default is ~/.notes. Specify with --folder"
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
	usage
	exit 1
fi

# Assign arguments
SEARCH_TERM="$1"
OPEN_PROGRAM="${2:-$(command -v batcat || command -v bat || echo cat)}"
SEARCH_FOLDER="$HOME/.notes"

# Check for named parameter '--folder'
for arg in "$@"; do
	case $arg in
	--folder=*)
		SEARCH_FOLDER="${arg#*=}"
		shift
		;;
	esac
done

# Search for the provided term in the specified folder and open the selected file with the specified program
rg -uu "$SEARCH_TERM" "$SEARCH_FOLDER" | fzf | cut -d':' -f1 | xargs -I '{}' "$OPEN_PROGRAM" '{}'
