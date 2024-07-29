#!/usr/bin/env bash

set -e

scripts/download_cmudict.sh

DATA_DIR="data/java_id_female"
#LJS_ARCH="LJSpeech-1.1.tar.bz2"
#LJS_URL="http://data.keithito.com/data/speech/${LJS_ARCH}"

if [ ! -d ${DATA_DIR} ]; then
  echo "Downloading java_id_female ..."
  wget -q https://www.openslr.org/resources/41/jv_id_female.zip
  echo "Extracting java_id_female ..."
  unzip java_id_female.zip
  rm -f java_id_female.zip
fi
