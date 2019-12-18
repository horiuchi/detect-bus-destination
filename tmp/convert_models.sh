#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

tensorflowjs_converter \
	--input_format=tf_saved_model \
	--output_node_names='MobilenetV1/Predictions/Reshape_1' \
	--saved_model_tags=serve \
	--skip_op_check \
	bus-destination/train_output/model/export/Servo/1576235111 \
	bus-destination/train_output/model/export/web_model

