Instructions
============

    $ aws s3 mb s3://spring-boot-on-lambda-demo
    $ aws cloudformation package --template-file sam.yaml --output-template-file target/output-sam.yaml --s3-bucket spring-boot-on-lambda-demo
    $ aws cloudformation deploy --template-file target/output-sam.yaml --stack-name spring-boot-on-lambda-demo --capabilities CAPABILITY_IAM
    $ aws cloudformation describe-stacks --stack-name spring-boot-on-lambda-demo