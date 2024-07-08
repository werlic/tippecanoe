# Start from ubuntu
FROM ubuntu:16.04

ENV DATA_DIR /data
ENV BUILD_PACKAGES cmake wget git ca-certificates 
ENV DEP_PACKAGES build-essential libsqlite3-dev zlib1g-dev

# Update repos and install dependencies
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install ${BUILD_PACKAGES} \
  && apt-get -y install ${DEP_PACKAGES}

# Pull tippecanoe from source
RUN mkdir -p /tmp
WORKDIR /tmp
RUN git clone https://github.com/mapbox/tippecanoe.git tippecanoe

# Build tippecanoe
WORKDIR /tmp/tippecanoe
RUN make \
  && make install

# Run the tests
CMD make test

WORKDIR ${DATA_DIR}
ENTRYPOINT [ "tippecanoe" ]