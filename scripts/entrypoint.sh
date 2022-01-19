#!/bin/sh

# if any errors in the script, exit the shell (useful for debugging)
set -e

python manage.py collectstatic --noinput

# command that runs our app using uWSGI
# we run it on TCP socket, port 8000
# run as a master thread (e.g. run uWSGI on the foreground, not the background)
# --enable-threads enables multithreading in uWSGI
# run the <projectname>.wsgi module (aka wsgi.py file)
uwsgi --socket :8000 --master --enable-threads --module app.wsgi