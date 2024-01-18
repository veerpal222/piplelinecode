FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN  yum install httpd -y
ADD  https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html
WORKDIR /var/www/html
RUN  yum install zip unzip -y
RUN  unzip oxer.zip  
RUN  cp -rf oxer-html/* .
RUN  rm -rf oxer.zip oxer-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
