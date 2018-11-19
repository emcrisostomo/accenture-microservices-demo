#!/bin/sh

# Make sure you've added the deployment section to the Elastic Beanstalk
# configuration file .elasticbeanstalk/config.yml:
#
#   deploy:
#     artifact: [binary].jar
#
eb create --single