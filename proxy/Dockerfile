# Dockerfile specifically for proxy

# Official proxy docker container for unprivileged user (i.e. not root)
FROM nginxinc/nginx-unprivileged:1.20.2-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

# switching user to root so we can create a docker image file
USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

# switch back to the unprivileged proxy user
USER nginx