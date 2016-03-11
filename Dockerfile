FROM centos:centos6

RUN yum update -y
RUN yum -y install wget

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
RUN rpm --import http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
RUN rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
RUN rpm -ivh http://mirror.cogentco.com/pub/linux/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum -y groupinstall 'Development Tools'
RUN yum -y install ntp sudo telnet bind-utils vixie-cron crontabs httpd \
           openssl-devel openssl mod_ssl mysql mod_auth_mysql \
           mysql-devel php-devel php php-domxml php-gd php-mbstring \
           php-mysql php-ncurses php-pear php-cliphp-common php-pdo
RUN yum -y update
RUN yum clean all

RUN mkdir /home/rconfig
COPY . /home/rconfig
RUN chown -R apache: /home/rconfig

RUN mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.original
RUN cp /home/rconfig/www/install/httpd.conf.new /etc/httpd/conf/httpd.conf

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]