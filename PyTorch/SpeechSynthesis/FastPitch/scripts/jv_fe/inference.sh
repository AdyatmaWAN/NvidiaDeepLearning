#!/usr/bin/env bash

set -a

bash scripts/download_models.sh waveglow

PYTHONIOENCODING=utf-8

: ${BATCH_SIZE:=20}
: ${FILELIST:="filelists/jv_fe_test.tsv"}
: ${FASTPITCH:="output_jv_fe/FastPitch_checkpoint_1000.pt"}
: ${OUTPUT_DIR:="output_jv_fe/audio_jv_fe_test_fastpitch1000ep_waveglow_denoise0.01"}

# Disable HiFi-GAN and enable WaveGlow
HIFIGAN=""
WAVEGLOW="pretrained_models/waveglow/nvidia_waveglow256pyt_fp16.pt"

bash scripts/inference_example.sh "$@"
