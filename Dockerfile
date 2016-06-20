FROM ubuntu:14.04
MAINTAINER bizruntime.com
#RUN apt-get -y update && apt-get -y upgrade && apt-get install -y git apache2 php5 libapache2-mod-php5 php5-mcrypt libapache2-mod-auth-mysql php5-mysql mysql-client
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y git && apt-get install -y nano unzip wget php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl
WORKDIR /opt/
#RUN wget http://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && rsync -avP wordpress/ /var/www/html/
#RUN rm -rf /var/www/html/wp-content
RUN git clone https://github.com/sachinkarale/weh-docker-wordpress.git
RUN rsync -avP weh-docker-wordpress/ /var/www/html/ && rm -rf weh-docker-wordpress
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa && \
echo "Host github.com\n\tStrictHostKeyChecking no\n" > /root/.ssh/config
WORKDIR /var/www/html
RUN rm index.html
RUN chown -R www-data:www-data *  && chmod 777 /var/www/html/
#VOLUME ["/var/www/html"]
EXPOSE	80
#CMD ["./etc/init.d/run.sh "]
CMD /etc/init.d/apache2 restart && sleep 500d 
