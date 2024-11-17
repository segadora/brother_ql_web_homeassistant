#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

MODEL="$(bashio::config 'model')"
DEVICE="$(bashio::config 'device')"
DEFAULT_SIZE="$(bashio::config 'default_size')"

echo "Starting serivce on $(date +%F\ %T)"

cat <<< $(jq '.label.default_size="'$DEFAULT_SIZE'"' config.example.json | jq '.printer.model="'$MODEL'"' | jq '.printer.printer="'$DEVICE'"') > config.json

echo "Config:"

cat config.json

python -m brother_ql_web --configuration config.json --model $MODEL $DEVICE

