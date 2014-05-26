
#!/bin/bash

# bash-script to create tar file for distribution

# Get tag branch and number of commits since
describe=`git describe HEAD`
# Remove hash
describe=${describe%-*}

# Save file name
file=fvar-$describe.tar.gz

rm -f $file
# Create the archive (with prefix)
git archive --prefix fvar-$describe/ \
    --format tar.gz \
    -o $file HEAD

# printout the created filename
echo $file