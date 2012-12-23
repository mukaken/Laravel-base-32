#! /usr/bin/sh

rm -f /tmp/markdown.tmp

inputfile=`pwd`/$1

php /FULL-PATH/artisan markdown $inputfile /tmp/markdown.tmp

if [ $? -eq 0 ]
then
    firefox /tmp/markdown.tmp &
    # google-chrome /tmp/markdown.tmp &
fi
