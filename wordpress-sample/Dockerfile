FROM sachin1992/wordpress:common
MAINTAINER sachin.karale@bizruntime.com
WORKDIR /var/www/html/wp-content/
RUN mv /var/www/html/wp-content/plugins plgins-old 
RUN git clone git@github.com:sachinkarale/plugins.git
RUN apt-get update -y  && apt-get install -y cron nano 
#RUN unzip wordpress-plugins/*.zip  -d /var/www/html/wp-content/plugins/  && rm -rf wordpress-plugins
RUN for z in plugins/*.zip ; do unzip $z -d plugins/ ; done && chown -R www-data:www-data plugins && rm plugins/*.zip
WORKDIR /opt
#ADD git-scan.sh ./git-scan.sh  
#RUN  chmod 777 git-scan.sh && echo "* 1    * * *   root" "sh /opt/git-scan.sh" >> /etc/crontab
#ADD git-delete.sh ./git-delete.sh
#RUN  chmod 777 git-delete.sh && echo "* 1    * * *   root" "sh /opt/git-delete" >> /etc/crontab
EXPOSE	80
CMD /etc/init.d/apache2 restart && sleep 500d 
