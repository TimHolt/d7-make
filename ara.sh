#!/bin/bash
# useage: ./ara.sh source-docroot destination
# note: destination is optional, if not selected it will set to ara
# Send Bug Reports: Chris.Rutter@acquia.com

###
# TODO
# - Find patches and place them in the patches directory
# - Find non-Drupal directories in the SOURCE docroot and place them in local (i.e. phpMyAdmin)
###

LOG=ara.log
SOURCE=${1}

## FOR TESTING REMOVE LOG FILE ON EACH RUN
#rm ${LOG}

echo -e "*\n**\n***\nara.sh Started: $(date)\n***\n**\n*" | tee -a ${LOG}

### Check if source exists, if not CRASH
if [ -d ${SOURCE} ]; then
 echo "Source directory ${SOURCE} exists." | tee -a ${LOG}
else
 echo -e "$(tput bold)$(tput setaf 1)FATAL ERROR$(tput sgr0): Source directory does not exist.\n Exiting" | tee -a ${LOG}
 exit 1
fi

### If DESTINATION is not set, set it to ara
if [ -n "${2}" ]; then
  DESTINATION=${2}
else
  DESTINATION="ara"
fi

### Check if destination exists, Check if it is empty, Create it if it doesn't exist
if [ -d ${DESTINATION} ]; then
 echo "Destination directory ${DESTINATION} exists." | tee -a ${LOG}
 if [ "$(ls -A ${DESTINATION})" ]; then
   echo "${DESTINATION} is NOT empty"
   read -p "Are you sure you want to overwrite the ${DESTINATION} directory? (y/n)"
   if [[ "$REPLY" != [yY] ]]; then
     echo "You did not reply with Y or y, Quiting."
     exit 1
   fi
 else
    echo "${DESTINATION} is Empty"
 fi
else
 echo -e "Destination directory does not exist.\n Creating destination directory" | tee -a ${LOG}
 mkdir -vp ${DESTINATION} 2>&1 | tee -a ${LOG}
fi

### Which distro?
options1="acquia commons drupal pressflow quit"

#eval set $options1
#select DISTRO in "$@"
DISTRO="drupal"
#do
  echo ${DISTRO}
  if [ "${DISTRO}" = quit ]; then
    exit
  fi

  echo "Distribution is $(tput setaf 4)${DISTRO}$(tput sgr0)" | tee -a ${LOG}

  ### Create Directories
  echo "Creating subdirectories..." | tee -a ${LOG}
  mkdir -vpm 755 ${DESTINATION}/docroot/sites 2>&1 | tee -a ${LOG}
  mkdir -vpm 755 ${DESTINATION}/vendor/${DISTRO} 2>&1 | tee -a ${LOG}
  mkdir -vpm 755 ${DESTINATION}/local/sites 2>&1 | tee -a ${LOG}
  mkdir -vm 755 ${DESTINATION}/local/common 2>&1 | tee -a ${LOG}
  mkdir -vm 755 ${DESTINATION}/scripts 2>&1 | tee -a ${LOG}
  mkdir -vm 755 ${DESTINATION}/patches 2>&1 | tee -a ${LOG}
  ###
  # Not used on AH
  #mkdir -vm 775 ${DESTINATION}/files 2>&1 | tee -a ${LOG}
  ###

  ### Rsync files from source
  echo "Rsyncing core files..." | tee -a ${LOG}
  rsync -av --exclude=.svn --exclude files/ --exclude sites/ ${SOURCE}/ ${DESTINATION}/vendor/${DISTRO}/ 2>&1 | tee -a ${LOG}

  ###
  # Not used on AH
  # Files Directories
  #echo "Rsyncing Docroot Files..." | tee -a ${LOG}
  #if [ -d ${SOURCE}/files ]; then
  #  rsync -av --exclude=.svn ${SOURCE}/files ${DESTINATION}/files/ 2>&1 | tee -a ${LOG}
  #else
  #  echo "${SOURCE}/files does not exist" | tee -a ${LOG}
  #fi
  #for i in ${SOURCE}/sites/*
  #do
  #  if [ -d "$i" ]; then
  #    if [ -d ${SOURCE}/sites/$(basename $i)/files ]; then
  #      echo "Rsyncing ${SOURCE}/sites/$(basename $i)/files/ to ${DESTINATION}/files/sites/$(basename $i)/files/" | tee -a ${LOG}
  #      mkdir -vpm 775 ${DESTINATION}/files/sites/$(basename $i)/files/ 2>&1 | tee -a ${LOG}
  #      rsync -av --exclude=.svn ${SOURCE}/sites/$(basename $i)/files/ ${DESTINATION}/files/sites/$(basename $i)/files/ 2>&1 | tee -a ${LOG}
  #    else
  #      echo "${SOURCE}/sites/$(basename $i)/ does not contain a files directory" | tee -a ${LOG}
  #    fi
  #  fi
  #done
  ###

  # /local/common/
  rsync -av --exclude=.svn --exclude files/ ${SOURCE}/sites/all ${DESTINATION}/local/common/ 2>&1 | tee -a ${LOG}
  rsync -av ${SOURCE}/.htaccess ${DESTINATION}/local/common/ 2>&1 | tee -a ${LOG}
  rsync -av ${SOURCE}/robots.txt ${DESTINATION}/local/common/ 2>&1 | tee -a ${LOG}

  # /local/sites/
  for i in ${SOURCE}/sites/*
  do
    if [ -d "$i" ] && [ "$(basename $i)" != all ]; then
      echo "Rsyncing ${SOURCE}/sites/$(basename $i) to ${DESTINATION}/local/sites/" | tee -a ${LOG}
      rsync -av --exclude=.svn --exclude files ${SOURCE}/sites/$(basename $i) ${DESTINATION}/local/sites/ 2>&1 | tee -a ${LOG}
    fi
  done

  ### Create Includes
  echo "Creating include files..." | tee -a ${LOG}
  for i in ${SOURCE}/*.php
  do
    if [ -f "$i" ]; then
      echo "<?php include '../vendor/${DISTRO}/$(basename $i)'; ?>" > ${DESTINATION}/docroot/$(basename $i) | tee -a ${LOG}
    fi
  done

  ### Create Symlinks
  echo "Creating Symlinks..." | tee -a ${LOG}
  ln -vs ../local/common/.htaccess ${DESTINATION}/docroot/.htaccess 2>&1 | tee -a ${LOG}
  ln -vs ../local/common/robots.txt ${DESTINATION}/docroot/robots.txt 2>&1 | tee -a ${LOG}
  ###
  # Not used on AH
  #ln -vs ../files ${DESTINATION}/docroot/files 2>&1 | tee -a ${LOG}
  ###
  # Sites Symlinks
  ln -vs ../../local/common/all ${DESTINATION}/docroot/sites/all 2>&1 | tee -a ${LOG}
  for i in ${DESTINATION}/local/sites/
  do
    if [ -d "$i" ] && [ "$(basename $i)" != sites ]; then
      ln -vs ../../local/sites/$(basename $i) ${DESTINATION}/docroot/sites/$(basename $i) 2>&1 | tee -a ${LOG}
    fi
  done

  # Symlink the remaining directories from vendor
  for i in ${DESTINATION}/vendor/${DISTRO}/*
  do
    if [ -d "$i" ] && [ "$(basename $i)" != sites ]; then
      ln -vs ../vendor/${DISTRO}/$(basename $i) ${DESTINATION}/docroot/$(basename $i) 2>&1 | tee -a ${LOG}
    fi
  done

  ###
  # Not used on AH
  # Symlink the sites/*/files directories to files/sites/*/files
  #for i in ${DESTINATION}/local/sites/*
  #do
  #  if [ -d "$i" ]; then
  #    ln -vs ../../../files/sites/$(basename $i)/files ${DESTINATION}/local/sites/$(basename $i)/files | tee -a ${LOG}
  #  fi
  #done
  #if [ -d ../../../files/sites/all/files ]; then
  #  ln -vs ../../../files/sites/all/files ${DESTINATION}/local/common/all/files | tee -a ${LOG}
  #fi
  ###
  echo -e "*\n**\n***\nara.sh Ended: $(date)\n***\n**\n*" | tee -a ${LOG}

exit
#done
