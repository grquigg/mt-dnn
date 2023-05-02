#!/usr/bin/env bash
############################################################## 
# This script is used to download resources for MT-DNN experiments
############################################################## 

BERT_DIR=$(pwd)/mt_dnn_models
if [ ! -d ${BERT_DIR}  ]; then
  echo "Create a folder BERT_DIR"
  mkdir ${BERT_DIR}
fi

## Download MT-DNN models
#wget https://mrc.blob.core.windows.net/mt-dnn-model/mt_dnn_base.pt -O "${BERT_DIR}/mt_dnn_base_uncased.pt"
wget https://mrc.blob.core.windows.net/mt-dnn-model/mt_dnn_large.pt -O "${BERT_DIR}/mt_dnn_large_uncased.pt"
#wget https://mrc.blob.core.windows.net/mt-dnn-model/msr-longt5pp.zip -O "${BERT_DIR}/msr-longt5pp.zip" 
## MT-DNN-KD
#wget https://mrc.blob.core.windows.net/mt-dnn-model/mt_dnn_kd_large_cased.pt -O "${BERT_DIR}/mt_dnn_kd_large_cased.pt"


if [ "$1" == "model_only" ]; then
  exit 1
fi

DATA_DIR=$(pwd)/data
if [ ! -d ${DATA_DIR}  ]; then
  echo "Create a folder $DATA_DIR"
  mkdir ${DATA_DIR}
fi

## DOWNLOAD GLUE DATA
## Please refer glue-baseline install requirments or other issues.
git clone https://github.com/nyu-mll/jiant-v1-legacy.git
cd jiant-v1-legacy
python scripts/download_glue_data.py --data_dir $DATA_DIR --tasks all

cd ..
rm -rf jiant-v1-legacy
