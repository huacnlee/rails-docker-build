# What is docker-ruby-aws

## Build from Source
1. Make sure [Docker](https://www.docker.com) is installed.

2. Clone _docker-aws_ from [GitHub](https://github.com/cgswong/docker-aws)

   ```sh
   git clone https://github.com/cgswong/docker-aws.git
   ```

3. Build the docker image

   ```sh
   cd docker-aws
   docker build -t [your_name]/aws:latest .
   ```

4. Run a docker container with that image

   ```sh
   docker run -it [your_name]/aws:latest
   ```

## AWS Credentials
There are three primary methods for setting up your AWS credentials:

1. Run the setup using the container, i.e. when you run the CLI tools for the first time, you need to configure the [aws cli](http://aws.amazon.com/cli) with your AWS credentials. For example:


   ```sh
   / # aws configure
   AWS Access Key ID [None]: [YOUR_AWS_ACCESS_KEY_ID_HERE]
   AWS Secret Access Key [None]: [YOUR_AWS_SECRET_ACCESS_KEY_ID_HERE]
   Default region name [None]: [YOUR_AWS_REGION_HERE]
   Default output format [None]: [YOUR_AWS_OUTPUT_FORMAT_HERE]
   ```

2. The volume `/root/.aws` has been exposed within the image for external access. Therefore you can mount the AWS credential file to the container:

   ```sh
   docker run --volume ~/.aws:/root/.aws cgswong/aws:latest aws [some_command]
   ```

3. By configuring your EC2 instances to make use of IAM Roles, the AWS CLI tools can then transparently make use of this role. Note however, that not all CLI tools can currently leverage this functionality, namely some of the RDS tools.

## Getting started with the AWS CLI and s3tools
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli). For S3 tools, see the [S3 tools documentation](http://s3tools.org/usage).
