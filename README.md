# docker-nginx-modsecurity-v3-waf
Web application firewall (WAF) via Nginx v1.15.5 + SpiderLabs/ModSecurity v3 shipped with OWASP Core Rule Set v3.2.0

# Main overview
- nginx in is upstreaming to node
- nginx service is build from official https://hub.docker.com/_/nginx/
- during build time nginx source is downloaded due to compilation of modules
- ModSecurity is set via https://www.nginx.com/blog/compiling-and-installing-modsecurity-for-open-source-nginx/
- OWASP ModSecurity Core Rule Set from is set during build time from https://github.com/SpiderLabs/owasp-modsecurity-crs/
- additional https://github.com/openresty/headers-more-nginx-module is also set and ``Server`` header is cleaned from response

## How to run

```docker-comose up```
```docker-comose up --build``` to rebuild 

## Log files

## Main conf files

## Fastest way to upgrade NGINX

## Fastest way to upgrade ModSecurity