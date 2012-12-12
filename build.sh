# Build script for the platform

# Set the variables

TEMP_DIR="tmp"
TEMP_ARA_DIR="aratmp"
PLATFORM_DIR="pltfrm"
MAKE_FILE="d7-platform.make"

# Nuke the tmp and pltmp dirs if they exists

if [ -d "${TEMP_DIR}" ]; then
    rm -rf ${TEMP_DIR}
fi

if [ -d "${TEMP_ARA_DIR}" ]; then
    rm -rf ${TEMP_ARA_DIR}
fi

# Build the platform in tmp directory first

drush make ${MAKE_FILE} ${TEMP_DIR}

# Run ara.sh and remove old tmp dir

./ara.sh ${TEMP_DIR} ${TEMP_ARA_DIR}

# Nuke the old vendor/drupal folder in ${PLATFORM_DIR}

rm -rf ${PLATFORM_DIR}/vendor/drupal

# Move new ${TEMP_ARA_DIR}/vendor/drupal into it's place

mv ${TEMP_ARA_DIR}/vendor/drupal ${PLATFORM_DIR}/vendor/

# Clean temp directories up

rm -rf ${TEMP_DIR}
rm -rf ${TEMP_ARA_DIR}
rm -rf ara.log

# Clear Drupal Site Caches

drush cc all
