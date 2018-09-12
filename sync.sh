#!/bin/ash

set -e

echo "$(date) - Start"

aws configure set default.s3.max_concurrent_requests $MAX_CONCURRENT_REQUESTS
aws s3 sync s3://$SOURCE_BUCKET$SOURCE_BUCKET_PATH s3://$DESTINATION_BUCKET$DESTINATION_BUCKET_PATH $PARAMS

echo "$(date) End"
