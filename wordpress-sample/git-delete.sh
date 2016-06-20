cd /var/www/html/wp-content/plugins/
git commit -a -m "plugins removed"
git status | cat >> /tmp/deleted-plugin.log
git push -u origin master
