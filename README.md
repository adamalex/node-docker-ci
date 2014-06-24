### Use Automated Builds on Docker Hub for easy Continuous Integration of Node.js projects

The official [Docker Hub](https://hub.docker.com/) provides an [Automated Builds](http://docs.docker.com/docker-hub/builds/) feature for consistent building of Docker images. Another possible use case for this service, which hasn't received as much attention, is Continuous Integration. Simply provide a `Dockerfile` for your project that runs tests during `docker build`. Docker Hub's integration with GitHub and Bitbucket will pick up new commits, run your tests, and generate new Docker images when tests are successful. Further, the service offers [webhooks](http://docs.docker.com/docker-hub/builds/#webhooks), which can be utilized to extend this use case into Continuous Deployment.

### Example files

* `Dockerfile` creates a Node.js environment for the sample project, then uses `npm` to install dependencies and run the project's tests during image creation.  The image [ENTRYPOINT](http://docs.docker.com/reference/builder/#entrypoint) and default command are set to `npm start` so `docker run` will default to launching the Node.js project within the container.  Tests are run only once, during image creation, so all generated images are pre-certified and can be deployed and started without rerunning the tests

* The remainder of the files in this repo provide an example Node.js project that responds to `npm test` and `npm start`

### Usage

1. Copy `Dockerfile` into any Node.js project that responds to `npm test` and `npm start`

1. Update the ADD commands to include all project files needed for testing and running the app

1. To test with a local image, run `docker build --tag="mynodeapp" .`

1. To start the local image, run `docker run -i -t -P mynodeapp`

1. To use Docker Hub for CI, push the project and its Dockerfile to GitHub or BitBucket and [configure your automated build](http://docs.docker.com/docker-hub/builds/#setting-up-automated-builds-with-github)

1. Consider using the [webhooks](http://docs.docker.com/docker-hub/builds/#webhooks) feature to trigger deployments for successful builds

### Getting In Touch

[Tweet at me](https://twitter.com/adamalex) or [File an issue](https://github.com/adamalex/node-docker-ci/issues)
if you have questions or comments. Suggestions or ideas for improvement are greatly appreciated.
