#!/bin/sh
#update and install dependencies
apt-get update
apt-get install -y mc mlocate apt-utils autoconf automake build-essential git libcurl4-openssl-dev libgeoip-dev liblmdb-dev libpcre++-dev libtool libxml2-dev libyajl-dev pkgconf wget zlib1g-dev

#updatedb #mlocate

#make modsecurity
git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity
cd ModSecurity
git submodule init
git submodule update
./build.sh
./configure
make
make install


# Download the NGINX Connector for ModSecurity and Compile It as a Dynamic Module + Headers More
cd /
wget http://nginx.org/download/nginx-1.15.5.tar.gz
tar xvzf nginx-1.15.5.tar.gz
cd ../nginx-1.15.5
# Download the NGINX Connector for ModSecurity and Compile It as a Dynamic Module
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git
#add headers-more
git clone https://github.com/openresty/headers-more-nginx-module.git headers-more-nginx-module


./configure --with-compat --add-dynamic-module=./ModSecurity-nginx --add-dynamic-module=./headers-more-nginx-module
make modules
cp objs/ngx_http_modsecurity_module.so /usr/lib/nginx/modules
cp objs/ngx_http_headers_more_filter_module.so /usr/lib/nginx/modules

#configure env
mkdir /etc/nginx/conf/
cp /ModSecurity/unicode.mapping /etc/nginx/conf/

#install crs
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git /usr/src/owasp-modsecurity-crs
cp -R /usr/src/owasp-modsecurity-crs/rules/ /etc/nginx/conf/
# remove example extension
mv /etc/nginx/conf/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf{.example,}
mv /etc/nginx/conf/rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf{.example,}



