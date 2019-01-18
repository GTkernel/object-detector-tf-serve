# Camera feed object detector using Tensorflow Serving

Program to detect objects using Tensorflow Detection API and YOLO on a video stream. The scripts are written in Python3.

## Folder structure

    .
    ├── object_detection                    # The actual code to detect objects
    │   ├── feed.py                         # Gets a video feed, predicts ands shows the detections
    │   ├── core                            # Helper functions from Tensorflow Detection API
    │   ├── data                            # Extra content (now Pickle of coco categories)
    │   └── utils                           # Helper functions from Tensorflow Detection API
    │
    ├── tf_serve                            # Dockerfile and models for Tensorflow Serving
    │   ├── config                          # Configs
    |   |   └── model_config                # Config file for the specific models
    │   ├── models                          # Neural networks, exported as Tensorflow Serving models
    │   └── Dockerfile                      # Custom build of the Tensorflow/Serving image
    │
    ├── yolo                                # YOLO object detection, without Tensorflow Serving
    │   ├── model                           # Modelfiles
    |   |   ├── coco.names                  # Coco category names
    |   |   └── darknet_yolov3_tiny.pb      # Converted model from YoloV3
    │   ├── utils                           # Helper functions from TODO
    |   |   └── utils.py                    # Functions to create detection boxes
    │   └── feed.py                         # Gets a video feed, predicts ands shows the detections


## Dependencies

This build is based on Tensorflow Object Detection API which depends on the following libraries:

*   Pillow
*   Jupyter notebook
*   Matplotlib
*   Tensorflow (>=1.9.0)
*   Requests
*   OpenCV
*   Pipenv
*   Docker

Luckily all these Python packages are all declared inside a Pipenv.

## Installation

### General

Clone this repo:

```bash
git clone https://github.com/MoerkerkeLander/camera-feed-object-detector-tf-serve.git
cd camera-feed-object-detector-tf-serve
```

To enable the Python environment we use Pipenv. If you don't have this installed, we can use pip:

```bash
pip install pipenv
```

To setup Pipenv and install all the dependencies:

```bash
pipenv install -d
```

All the Python packages and Python itself should now be installed inside an virtual environment.


## Usage

### Tensorflow Serving

Install [Docker](https://www.docker.com/products/docker-desktop).

Build the Docker image using the Dockerfile. The name of the image is object-detect.

```bash
cd tf-serve
docker build -t object-detect .
```

Run the Docker image.

```bash
docker run object-detect
```

Now Tensorflow Serving is running inside a Docker container. We can access it by sending a REST request or a gRPC call. We chose for REST because it is the simplest to setup. Inside the models directory

### Object detection script

Firstly, enter the virtual environment:

```bash
pipenv shell
```

Now we can excecute the different Python scripts. To


### General

## TensorFlow Detection API

Convert model from [ zoo ](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md) to a TensorFlow Serving model.

First download a model from the [model zoo](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md).

```bash
wget "http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz"
tar -xvf ssd_mobilenet_v1_coco_2018_01_28.tar.gz
```

```bash
git clone https://github.com/tensorflow/models.git tensorflow-models
cd tensorflow-models/research/object_detection
```

Follow the installation guide inside the repo.


## Run TF serve

### Multiple models

- Create config file
- Create Dockerfile with all the instructions
