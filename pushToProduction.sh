#!/bin/bash

# Parameters
SERVER=justin@justiniles.cloudapp.net:/home/justin/my_webpage/static/
DEFAULT_FILES=(index.html \
   css/ \
   js/ \
   files/ \
   images/ \
   favicon.ico)

# If no arguments are supplied, say so and exit
if [ $# -eq 0 ] 
   then
      echo "No parameters supplied."
      exit
fi

# Check if we're uploading 'all' default files
if [ $1 == "all" ]
   then
      echo "Uploading default website files..."
      for i in "${DEFAULT_FILES[@]}"
      do 
         echo "scp -r $i $SERVER"
         scp -r $i $SERVER
      done
      exit
fi

# We're uploading just argument files
echo "Uploading $# file(s)..."
for i in "$@"
do 
   echo "scp -r $i $SERVER"
   scp -r $i $SERVER
done
