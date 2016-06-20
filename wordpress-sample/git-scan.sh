#!/bin/sh

cd /var/www/html/wp-content/plugins/
rm -rf *.zip
git config --global user.email "sachin.karale@bizruntime.com"
git config --global user.name "sachinkarale"
git add *
git status | cat >> /tmp/plugin.log
git commit -a -m "modification done"
git pull
git push -u origin master


