FROM jbzdak/docker-wkhtml

LABEL maintainer="jacek@askesis.pl"

# Install dependencies for running web service
RUN apt-get update && apt-get install -y python-pip
RUN pip install werkzeug executor gunicorn flask

ADD app.py /app.py
EXPOSE 80

ENTRYPOINT ["usr/local/bin/gunicorn"]

CMD ["-b", "0.0.0.0:80", "--log-file", "-", "app:application"]
