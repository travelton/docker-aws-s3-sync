# travelton/aws-s3-sync

Docker container that periodically syncs one S3 bucket to another S3 bucket using the [AWS Command Line Interface tool](https://aws.amazon.com/cli/) and cron.

## Usage

    docker run -d [OPTIONS] travelton/aws-s3-sync

### Required Parameters:

* `-e KEY=<KEY>`: User Access Key
* `-e SECRET=<SECRET>`: User Access Secret
* `-e REGION=<REGION>`: Region of your bucket
* `-e DESTINATION_BUCKET=<DESTINATION_BUCKET>`: The name of your bucket
* `-e SOURCE_BUCKET=<SOURCE_BUCKET>`: The name of your bucket

### Optional parameters:

* `-e PARAMS=`: parameters to pass to the sync command ([full list here](http://docs.aws.amazon.com/cli/latest/reference/s3/sync.html)).
* `-e SOURCE_BUCKET_PATH=<SOURCE_BUCKET_PATH>`: The path of your s3 bucket where the files should be synced FROM (must start with a slash), defaults to "/" to sync to bucket root
* `-e DESTINATION_BUCKET_PATH=<DESTINATION_BUCKET_PATH>`: The path of your s3 bucket where the files should be synced to (must start with a slash), defaults to "/" to sync to bucket root
* `-e CRON_SCHEDULE="0 1 * * *"`: specifies when cron job starts ([details](http://en.wikipedia.org/wiki/Cron)), defaults to `0 1 * * *` (runs every night at 1:00).
* `now`: run container once and exit (no cron scheduling).

## Examples:

Sync every hour with cron schedule (container keeps running):

    docker run -d \
        -e KEY=mykey \
        -e SECRET=mysecret \
	      -e REGION=region \
        -e SOURCE_BUCKET=mybucket \
        -e DESTINATION_BUCKET=mybucket \
    		-e SOURCE_BUCKET_PATH=/path \
        -e DESTINATION_BUCKET_PATH=/path \
        -e CRON_SCHEDULE="0 * * * *" \
        travelton/aws-s3-sync

Sync just once (container is deleted afterwards):

    docker run --rm \
        -e KEY=mykey \
        -e SECRET=mysecret \
    		-e REGION=region \
        -e SOURCE_BUCKET=mybucket \
        -e DESTINATION_BUCKET=mybucket \
        travelton/aws-s3-sync now

## Credits

This container was forked and tweaked to sync two buckets, rather than a local source, https://github.com/futurevision/docker-aws-s3-sync.
