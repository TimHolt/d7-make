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

# Nuke the old folders in ${PLATFORM_DIR}

rm -rf ${PLATFORM_DIR}/vendor/drupal
rm -rf ${PLATFORM_DIR}/local/common/all

# Move new folders from ${TEMP_ARA_DIR} into place

mv ${TEMP_ARA_DIR}/vendor/drupal ${PLATFORM_DIR}/vendor/
mv ${TEMP_ARA_DIR}/local/common/all ${PLATFORM_DIR}/local/common/

# Clean temp directories up

rm -rf ${TEMP_DIR}
rm -rf ${TEMP_ARA_DIR}
rm -rf ara.log

# Put in symlink to development theme

cd ${PLATFORM_DIR}/local/common/all/themes
ln -s ../../../../../local/themes/custom/focus focus
cd ../../../../../

# Put in symlink to local blockcache_alter

cd ${PLATFORM_DIR}/local/common/all/modules
rm -rf blockcache_alter
ln -s ../../../../../local/modules/custom/blockcache_alter blockcache_alter
cd ../../../../../


# Clear Drupal Site Caches

cd pltfrm/docroot
drush -l make2.localhost cc all
drush -l deploy-test.localhost cc all
cd ../../
