# docker-uwsgi-flask-devel
deploy Flask app via uwsgi in development environment

Thi docker image take a Flask app from `/opt/flask`, install its dependencies (accroding to `requirements.txt`), and serve it with uwsgi protocol at tcp port `3031`.

The flask app should be located in module `app`.

As the app is served with uwsgi protocol, a reserved proxy server is required.

## Usage
```
docker run --name <server_name> -v <path_of_flask_app>:/opt/flask -d billlee/uwsgi-flask-devel
```

## Tips

### Logs
Python suppress stdout flushing without a tty. To watch the progress of `pip` with `docker logs -f`, you may execute `docker run` with an additonal argument `-t` to allocate a pseudo-tty.

## Data Directories
If the flask app is going to write something, such as SQLite databases, session files, etc., to a sub directories, you may `chmod 0770` against the directories.
