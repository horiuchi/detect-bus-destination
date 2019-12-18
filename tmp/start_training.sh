#!/bin/bash

set +eux

gcloud ai-platform jobs submit training object_detection_`date +%m_%d_%Y_%H_%M_%S` \
    --runtime-version 1.14 \
    --job-dir=gs://bus-destination/train_output/job \
    --packages /tmp/object_detection-0.1.tar.gz,/tmp/slim-0.1.tar.gz,/tmp/pycocotools-2.0.tar.gz \
    --module-name object_detection.model_main \
    --config /tmp/config.yaml \
    --region us-central1 \
    -- \
    --model_dir=gs://bus-destination/train_output/model \
    --pipeline_config_path=gs://bus-destination/train_input/config/faster_rcnn_resnet101_coco.config

