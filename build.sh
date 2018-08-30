#!/bin/bash

# change this to your local cpbo path, in case cpbo.exe is not in the current dir
cpbo_path="$1"
missionname="TvT_Breaking_Contact"

islands=`cat compatibleIslands.txt`

### AS AS USER, DONT EDIT BELOW THIS LINE ###

if [[ ! -f $cpbo_path ]]; then     cpbo_path="./cpbo.exe"
fi

if [[ ! -f $cpbo_path ]]; then     echo "warning: cpbo path not found, will not build pbo files!"     exit 1
fi


head=`git reflog --decorate -1 --no-color`

# if possible, use current tag...
#version=`echo $head | grep -o -E 'tag: \w+' | sed -e 's/tag: //'`
version=`echo $head | sed -re 's/^.*tag: ([0-9a-z\.\-]+).*$/\1/'`

if [[ "$head" == "$version" ]]; then     # ...if not, use commit hash     #	version=`echo $head | grep --color=never -o -E '^[0-9a-f]+'`     version=`echo $head | sed -re 's/^([0-9a-f]+).*$/\1/g'`
fi

echo "current version: $version"

if [[ $version == "" ]]; then     echo "cant find tag OR commit hash. are you sure we're having a .git directory here?"     exit 2
fi

cwd=`pwd`

npm install

builddir="$cwd/../tmp-build"
mkdir -p "$builddir"
tmpdir="$builddir/tmpdir"

cp -r ./ "$tmpdir"
rm "$tmpdir/build.sh"
rm "$tmpdir/cpbo.exe"
rm -fr "$tmpdir/.git"
rm "$tmpdir/.gitattributes"
rm "$tmpdir/.gitignore"

echo "building PBO...";
$cpbo_path -y -p "$tmpdir" > /dev/null
echo "done (probably)"

pbofilename="${tmpdir}.pbo"

if [[ ! -f "$pbofilename" ]]; then     echo "örks"     exit 2
fi

echo "copying pbo for different islands..."
for island in $islands; do     cp "$pbofilename" "${builddir}/${missionname}_${version}.${island}.pbo"
done

echo "done. clean up..."
rm -r "$tmpdir"
rm "$pbofilename"
echo "plz see $builddir for pbo files"
sleep 2
