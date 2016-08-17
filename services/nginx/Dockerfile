FROM nginx

COPY ./startup.sh /usr/local/bin/startup
RUN chmod a+x /usr/local/bin/startup

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./include.d/ /etc/nginx/include.d/
COPY ./sites-enabled/spectrumatutsa.org.conf \
  /etc/nginx/sites-enabled/spectrumatutsa.org.conf

CMD startup
