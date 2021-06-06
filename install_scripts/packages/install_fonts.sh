#!/bin/sh
echo "Installing powerline fonts..."
pwd=$(pwd)
cd /tmp

if [ $? -ne 0 ]; then
	echo "Could not change to /tmp, something went wrong"
	exit 1
fi

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts

if [ $? -ne 0 ]; then
	echo "Could not change to /tmp/fonts, something went wrong"
	exit 1
fi

./install.sh

cd ..

if [ $? -ne 0 ]; then
	echo "Could not change to root dir, something went wrong"
	exit 1
fi

rm -rf fonts

cd $pwd
if [ $? -ne 0 ]; then
	echo "Could not change back to original directory, something went wrong"
	exit 1
fi

echo "Done"
