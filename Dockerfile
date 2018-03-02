# s2i-nodejs-container
FROM centos/s2i-base-centos7

EXPOSE 8080

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="elementsweb"

ENV NODEJS_VERSION=9 \
    NPM_RUN=start \
    NAME=nodejs

ENV SUMMARY="Platform for building and running NodeJS $NODEJS_VERSION applications" \
    DESCRIPTION="NodeJS $NODEJS_VERSION docker container for building and running \
    NodeJS applications."

LABEL summary="$SUMMARY" \
    description="$DESCRIPTION" \
    io.k8s.description="$DESCRIPTION" \
    io.k8s.display-name="NodeJS $NODEJS_VERSION" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,$NAME,$NAME$NODEJS_VERSION" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
    io.s2i.scripts-url="image:///usr/libexec/s2i"

# Download and install NodeJS v9.7.1
RUN mkdir -p /opt/node && \
  wget --no-verbose -P /opt/node/ https://nodejs.org/dist/latest-v9.x/node-v9.7.1-linux-x64.tar.gz && \
  tar -xvf /opt/node/node-v9.7.1-linux-x64.tar.gz --directory /opt/node

ENV PATH=/opt/node/node-v9.7.1-linux-x64/bin/:$PATH

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:0 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
