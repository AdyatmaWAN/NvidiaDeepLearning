# Make filelists
echo "Generating filelists..."
python scripts/jv_fe/split_jv_fe.py data/jv_id_female/line_index.tsv filelists/
echo "Generating filelists... OK"

# Extract pitch (optionally extract mels)
set -e

export PYTHONIOENCODING=utf-8

: ${DATA_DIR:=data/jv_id_female}
: ${ARGS="--extract-mels"}

echo "Extracting pitch..."
python prepare_dataset.py \
    --wav-text-filelists filelists/jv_fe_audio_text.txt \
    --n-workers 16 \
    --batch-size 1 \
    --dataset-path $DATA_DIR \
    --extract-pitch \
    --f0-method pyin \
    --symbol_set english_basic \
    $ARGS

echo "Extracting pitch... OK"
echo "./data/jv_id_female prepared successfully."
