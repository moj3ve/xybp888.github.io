#!/bin/bash
find ../ -name ".DS_Store" -depth -exec rm {} \;
dpkg-scanpackages -m ./debs > ./Packages
bzip2 -fks ./Packages
