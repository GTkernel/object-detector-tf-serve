# Kubernetes Deployment Steps

To deploy object detection service on K8s, we need to build the server image and client image separately:

- Model serving server: build image with `./tf-serve/Dockerfile`.
```
$ docker build -t obj-detect-tf-server .
```

- Image feeding client: build image with `../Dockerfile`.
```
$ docker build -t obj-detect-client .
```

## Run docker containers

- Server:
```
$ docker run -d obj-detect-server:latest
```

- Client:

Before running your customized docker image, make sure you have a corresponding configuration file, `config.ini`.
You can refer to `./config_k8s.ini`, and change some content to fit your environment, and be careful of its parameters:

```
[General]
detection_source = /tmp/video.mp4

[Tensorflow]
tf_serving_url = http://obj-detect-server:8501/v1/models/faster_rcnn_inception_v2:predict
```
The **detection_source** in section "General" is to declare the video file you are going to feed to the server; **tf_serving_url** is to specify the URL of server and the model for detection.

Now, you are good to run your client:
```
$ docker run -it -v $MP4_VIDEO_PATH:/tmp/video.mp4 -v $CONFIG_FILE_PATH:/opt/camera-feed/config.ini obj-detect-client:latest pipenv run python object_detection/feed.py
```

## Run K8s

You can refer to the YAML files we have here. Changing the environment variables in the file, and just run them directly.
