FROM mubox/build:beta

# Remove existing engines, we don't want to test those
RUN rm -rf /opt/engines/*

# Create folders for this engine
RUN mkdir -p /opt/engines/wordpress/bin && \
    mkdir -p /opt/engines/wordpress/lib && \
    mkdir -p /opt/engines/wordpress/templates

RUN curl https://codeload.github.com/mu-box/microbox-engine-nodejs/tar.gz/main | \
    tar -xzC /opt/engines/wordpress --strip-components 1

RUN curl https://codeload.github.com/mu-box/microbox-engine-php/tar.gz/main | \
    tar -xzC /opt/engines/wordpress --strip-components 1

# Add in this engine's files
ADD bin/. /opt/engines/wordpress/bin
ADD lib/. /opt/engines/wordpress/lib
ADD templates/. /opt/engines/wordpress/templates
