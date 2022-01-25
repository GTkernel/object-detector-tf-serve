FROM python:3.6-slim


ARG APP_DIR=/opt/camera-feed/
ENV PYTHONPATH=$APP_DIR
RUN mkdir -p $APP_DIR/object_detection/

RUN apt-get update && apt-get install --no-install-recommends -y ffmpeg libsm6 libxext6

COPY object_detection/ $APP_DIR/object_detection 
COPY Pipfile Pipfile.lock $APP_DIR
COPY k8s/config_k8s.ini $APP_DIR/config.ini

WORKDIR $APP_DIR

RUN pip install pipenv && pipenv install -d
