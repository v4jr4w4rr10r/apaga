#!/bin/bash

# ASCII Art
echo "  ____ _____  ____ _____ _____ _"
echo " / __ \`/ __ \\/ __ \`/ __ \`/ __ \`/"
echo "/ /_/ / /_/ / /_/ / /_/ / /_/ / "
echo "\\__,_/ .___/\\__,_/\\__, /\\__,_/  "
echo "    /_/          /____/         "


#Default size for the random string
size=8

#Parse command-line arguments
while getopts "hf:s:" opt; do
  case ${opt} in
    h )
      echo "Usage:"
      echo "    apaga -f file -s size"
      echo "Options:"
      echo "    -h Show this help message"
      echo "    -f Specify the target file to shred"
      echo "    -s Specify the size of the random string for renaming (default: 8, max: 16)"
      exit 0
      ;;
    f )
      file=$OPTARG
      ;;
    s )
      size=$OPTARG
      if ((size < 8)); then
        echo "Size must be at least 8."
        exit 1
      elif ((size > 16)); then
        echo "Size must be no more than 16."
        exit 1
      fi
      ;;
    \\? )
      echo "Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if file is specified
if [[ -z "$file" ]]; then
  echo "You must specify a file to shred."
  exit 1
fi

# Generate a random string of a given length
generate_random_string() {
  local length=$1
  local chars=( {a..z} {A..Z} {0..9} )
  local string
  for (( i=0; i<$length; i++ )); do
    string+=${chars[RANDOM%${#chars[@]}]}
  done
  echo $string
}

# Rename the file to a random string
random_string=$(generate_random_string $size)
mv "$file" "$random_string"

# Shred the file
sudo shred "$random_string" -f -n 35 -u -v -z
