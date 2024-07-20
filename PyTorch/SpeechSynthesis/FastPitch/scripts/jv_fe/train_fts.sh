#!/usr/bin/env bash

set -a

PYTHONIOENCODING=utf-8

# Mandarin & English bilingual
ARGS+=" --symbol-set english_basic"

# Initialize weights with a pre-trained English model
bash scripts/download_models.sh fastpitch
#ARGS+=" --init-from-checkpoint pretrained_models/fastpitch/nvidia_fastpitch_210824.pt"

AMP=false  # FP32 training for better stability

: ${DATASET_PATH:=data/jv_id_female}
: ${TRAIN_FILELIST:=filelists/jv_fe_audio_pitch_text_train.txt}
: ${VAL_FILELIST:=filelists/jv_fe_audio_pitch_text_val.txt}
: ${OUTPUT_DIR:=./output_jv_fe}

bash scripts/train.sh $ARGS "$@"
