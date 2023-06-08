export PASSAGE_DIR=$PWD/secrets/data 
export PASSAGE_RECIPIENTS_FILE=$PWD/secrets/recipients 
export PASSAGE_IDENTITIES_FILE=$HOME/.passage/identities

# Verify clean state
rm sourceme
# Get all filenames in the directory
filenames=$(ls "$PASSAGE_DIR")

# Loop through each filename
for filename in $filenames; do
  # Strip the file extension from the filename
  name_without_extension="${filename%.*}"

  # Get the encrypted data from GNU pass using the filename as the key
  encrypted_data=$(@passage@/bin/passage show "$name_without_extension")

  # Export the encrypted data as an environment variable
  echo "export $name_without_extension=$encrypted_data" >> sourceme
  source sourceme

done