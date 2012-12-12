# Build script for the platform
# Assumes that we are building the platform in a folder named "platform"

# Nuke the tmp dir if it exists

if [ -d "tmp" ]; then
    rm -rf tmp
fi

# Build the platform in tmp directory first

drush make d7-platform.make tmp

# Backup the current platform just in case
# Rsync what's in the tmp directory over into the platform directory
# We must keep stuff like settings.php, etc.


