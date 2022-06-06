# docker-nginx-modsecurity-v3-waf
Web application firewall (WAF) via Nginx v1.15.5 + SpiderLabs/ModSecurity v3 shipped with OWASP Core Rule Set v3.3.2

# Main overview
- nginx in is upstreaming to node
- nginx service is build from official https://hub.docker.com/_/nginx/
- during build time nginx source is downloaded due to compilation of modules
- ModSecurity is set via https://www.nginx.com/blog/compiling-and-installing-modsecurity-for-open-source-nginx/
- OWASP ModSecurity Core Rule Set from is set during build time from https://github.com/SpiderLabs/owasp-modsecurity-crs/
- additional https://github.com/openresty/headers-more-nginx-module is also set and ``Server`` header is cleaned from response

## How to run

- ```docker compose up``` and visit [localhost](localhost) 
- ```docker comopse up --build``` to rebuild 

## Log files
- waf/logs

## Main conf files
- https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/nginx.conf
- https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/modsecurity.conf subincluding:

	- CRS rules referenced inside are downloaded from github and added to image during build included via https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/modsec_includes.conf

	- https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/crs-setup.conf


 

## Fastest way to upgrade NGINX
- update version in https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/Dockerfile#L1
- update to same version in https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/build.sh#L21

## Fastest way to upgrade ModSecurity

- nothing much really to upgrade just invalidate docker cache and let the image rebuild in order to have new github repos to be downloaded
- optionally check newer branch ? https://github.com/kjakub/docker-nginx-modsecurity-v3-waf/blob/master/waf/build.sh#L9 
- check mod security conf files against offical github repos if any changes

## See it in action !

![enter XSS](https://raw.githubusercontent.com/kjakub/docker-nginx-modsecurity-v3-waf/master/screens/screen11.png)

![rules in action](https://raw.githubusercontent.com/kjakub/docker-nginx-modsecurity-v3-waf/master/screens/screen22.png)

![403 respose](https://raw.githubusercontent.com/kjakub/docker-nginx-modsecurity-v3-waf/master/screens/screen33.png)
