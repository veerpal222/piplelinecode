FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN  yum install httpd -y
ADD  https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html
WORKDIR /var/www/html
RUN  yum install zip unzip -y
RUN  unzip carvilla.zip
RUN  cp -rf carvilla-v1.0/* .
RUN  rm -rf carvilla.zip carvilla-v1.0
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
