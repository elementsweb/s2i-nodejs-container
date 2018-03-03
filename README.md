# s2i-nodejs-container
An Openshift source-to-image base container for building Node.js application image.

Features extended from `centos/s2i-base-centos7`:
- Installation of Node.js version 9.7.1 (includes npm installation)

The built image can be found at [j106306/s2i-nodejs-container](https://hub.docker.com/r/j106306/s2i-nodejs-container/).

## Development
More information about how to develop this S2I builder image can be found in the [Creating S2I Builder Image](./docs/creating-s2i-builder-image.md) docs.

### Building the image
Run `make build` to instruct Docker to build the image.

### Testing the image
Run `make test` to instruct Docker to build a test image and run tests in test/run.

### Create Openshift Image Stream
See [Creating an Image Stream by Manually Pushing an Image](https://docs.openshift.com/container-platform/3.4/dev_guide/managing_images.html#creating-an-image-stream-by-manually-pushing-an-image) to see how to create a new image stream for your base container. You will reference the new image stream in templates that build source code using this base container.
