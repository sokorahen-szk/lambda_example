#/bin/bash
set -eo pipefail
source .env

aws cloudformation package \
    --template-file ./build/sam.json \
    --output-template-file ./build/sam.deploy \
    --s3-bucket $S3_DEPLOY_BUCKET_NAME \
    --s3-prefix cloud-formations

aws cloudformation deploy \
    --template-file ./build/sam.deploy \
    --stack-name SampleStack \
    --capabilities CAPABILITY_NAMED_IAM