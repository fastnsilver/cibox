################################################################################
#
# NGINX
#
#    docker build -rm=true -t fans/nginx .
#    CONTAINER=$(docker run -d -p 2000:22 -p 8000:80 -t fans/nginx)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM        fans/factory-base:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>

################################################################################
# NGINX
# @see http://wiki.nginx.org/Install
################################################################################
ADD		etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo
RUN     yum install -y nginx
ADD     etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD     etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD     etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf

# fix -- nginx fails to write to /var/cache/nginx/client_temp
RUN 	chown -R nginx:nginx /var/cache/nginx

EXPOSE 80
