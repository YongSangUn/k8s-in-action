FROM ubuntu:latest
RUN apt-get update \
  && apt-get -y install fortune \
  && rm -rf /var/lib/apt/lists/*
ADD fortuneloop.sh /bin/fortuneloop.sh
RUN chmod 777 /bin/fortuneloop.sh
ENTRYPOINT ["/bin/fortuneloop.sh"]
CMD ["10"]

