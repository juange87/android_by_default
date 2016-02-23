#!/bin/bash

type="$1"

cd "REPO_HOME_HERE"
#./gradlew clean checkstyle checkstyleReport findbugs pmd assembleDebug runUnitTests

  if [ "$type" == 0 ]; then
    echo
    echo "*************************************************************************************"
    echo "  RUNINNG: lean checkstyle checkstyleReport findbugs pmd assembleDebug runUnitTests  "
    echo "*************************************************************************************"
    echo

    ./gradlew clean checkstyle checkstyleReport findbugs pmd assembleDebug runUnitTests


  elif [ "$type" == 1  ]; then

    NOT_PRESENT="List of devices attached"
    ADB_PATH="${ANDROID_HOME}/platform-tools"
    ADB_FOUND=`adb devices | tail -2 | head -1 | cut -f 1 | sed 's/ *$//g'`

    if [[ ${ADB_FOUND} == ${NOT_PRESENT} ]]; then
      echo
      echo "Android device seems to be missing."
      echo

    else
      echo
      echo "*************************************************************************************"
      echo "                                 RUNNING ANDROID UI TESTS                            "
      echo "*************************************************************************************"
      echo

      ./gradlew connectedCheck
    fi

  else
      echo
      echo "*************************************************************************************"
      echo "                 YOU SHOULD SELECT 0 FOR UNIT TEST OR 1 FOR UI TESTS                 "
      echo "*************************************************************************************"
      echo
  fi

