#!/bin/bash

DIRS=$(find . -maxdepth 1 -type d)
for i in ${DIRS}
do
	if [ "${i}" != '.' ]; then
	cd ${i};
	pwd;
	cd ..
	fi
done
