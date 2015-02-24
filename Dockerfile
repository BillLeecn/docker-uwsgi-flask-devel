FROM debian:wheezy

MAINTAINER Bill Lee "bill.lee.y@gmail.com"

RUN apt-get update && \
    apt-get install -y python-dev \
        python-pip \
        uwsgi \
        uwsgi-plugin-python

COPY uwsgi.ini /etc/uwsgi/uwsgi.ini

VOLUME ["/opt/flask"]

RUN useradd -r -s /bin/false -U uwsgi
EXPOSE 3031
CMD chgrp -R uwsgi /opt/flask && pip install -r /opt/flask/requirements.txt && uwsgi -M --ini /etc/uwsgi/uwsgi.ini
