FROM alpine:3.3

RUN apk --no-cache add \
      py-pip \
      python &&\
    pip install --upgrade \
      pip \
      awscli

ENV KEY=,SECRET=,REGION=,SOURCE_BUCKET=,SOURCE_BUCKET_PATH=/,DESTINATION_BUCKET=,DESTINATION_BUCKET_PATH=/,PARAMS=,CRON_SCHEDULE="0 1 * * *",MAX_CONCURRENT_REQUESTS=10

ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
