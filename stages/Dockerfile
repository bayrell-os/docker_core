FROM centos:7

ADD files/etc /etc
ADD files/app /var/www/app
ADD files/run.sh /root/run.sh

RUN cd ~; \
	echo "[1] Import keys"; \
	rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7; \
	rpm --import https://archive.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7; \
	rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi; \
	echo "[2] Install epel repository"; \
	yum update -y;\
	yum install epel-release wget deltarpm -y; \
	echo "[3] Install remi repository"; \
	wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm; \
	rpm -Uvh remi-release-7.rpm; \
	rm -f remi-release-7.rpm; \
	echo "[4] Install NodeJS repository"; \
	curl -sL https://rpm.nodesource.com/setup_8.x | bash -; \
	echo "[5] Update core system"; \
	yum update -y; \
	echo "[6] Install packages"; \
	yum install nginx nodejs php71 php71-php-fpm php71-php-mbstring mc nano supervisor less net-tools -y; \
	ln -s /usr/bin/php71 /usr/bin/php; \
	ln -s /usr/bin/php71-cgi /usr/bin/php-cgi; \
	npm install -g bayrell-lang-compiler; \
	echo "[7] Settings PHP"; \
	sed -i "s|;date.timezone =|date.timezone = Asia/Almaty|g" /etc/opt/remi/php71/php.ini; \
	sed -i "s|listen =.*|listen = /var/run/php71-fpm.sock|g" /etc/opt/remi/php71/php-fpm.d/www.conf; \
	sed -i "s|;listen.owner =.*|listen.owner = nginx|g" /etc/opt/remi/php71/php-fpm.d/www.conf; \
	sed -i "s|;listen.group =.*|listen.group = nginx|g" /etc/opt/remi/php71/php-fpm.d/www.conf; \
	sed -i "s|;listen.mode =.*|listen.mode = 0660|g" /etc/opt/remi/php71/php-fpm.d/www.conf; \
	echo "[8] Install NodeJS"; \
	curl -sL https://rpm.nodesource.com/setup_10.x | bash -; \
	yum install nodejs; \
	npm install -g bayrell-lang-compiler; \
	chmod +x /root/run.sh; \
	echo "Ok"

CMD ["/root/run.sh"]