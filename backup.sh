#!/bin/sh

# This script copy files mentioned inside `backup.conf` to the root of the project.

# file to look for the paths to backup.
backupPaths="./backup.conf"
# home directory path.
homeDirectory=~

echo " Clearing configurations directory..."
# removing the folder with exsiting contents. we have git version anyway!
rm -rf configurations
# creating it again for backup.
mkdir configurations
echo "Configurations directory cleared."
echo "Starting backup..."

# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  echo "Copying: $filePath"

  findThis="~/"
  replaceWith="$homeDirectory/"
  originalFile="${filePath//${findThis}/${replaceWith}}"

  # copying the files
  cp --recursive $originalFile ./configurations
done

git add .

echo "Backup finished! You can review & commit your changes."

