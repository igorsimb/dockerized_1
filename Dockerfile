FROM python:3.8-alpine

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
# the 3 .tmp services are required to install requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN pip install -r /requirements.txt
# we don't need the .tmp anymore, can delete them now
RUN apk del .tmp

RUN mkdir /app
# copy our /app to the docker's app folder
COPY ./app /app
# directory that contains our django project
WORKDIR /app
COPY ./scripts /scripts

# permissions
RUN chmod +x /scripts/*

# create folders for static and media files (-p means to create all subdirectories as well)
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

# create new user that will run our application (better than running it as a ROOT user)
RUN adduser -D user
# set user as the owner of /vol directory
RUN chown -R user:user /vol
# 755 = user has full access, the rest of the world has readonly
RUN chmod -R 755 /vol/web
# switch to the new user
USER user

# script that starts our application
CMD ["entrypoint.sh"]