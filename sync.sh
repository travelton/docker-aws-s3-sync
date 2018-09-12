#!/bin/ash

set -e

echo "$(date) - Start"

aws s3 sync s3://$SOURCE_BUCKET$SOURCE_BUCKET_PATH s3://$DESTINATION_BUCKET$DESTINATION_BUCKET_PATH $PARAMS

echo "$(date) End"
