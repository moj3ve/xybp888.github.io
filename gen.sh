#!/bin/bash
find ./ -name ".DS_Store" -depth -exec rm {} \;

for file in `ls ./debs`
    do
      if [[ -d "./debs/$file" ]]; then
        mkdir -p "./debs/$file"
        dpkg-deb -bZgzip "./debs/$file"
			fi
    done

dpkg-scanpackages -m ./debs > ./Packages
bzip2 -fks ./Packages
