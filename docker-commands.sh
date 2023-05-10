docker run -p 8000:8000 sample-flask:latest
docker exec -it sample-flask:latest /bin/bash

# build for a different architecture
docker buildx build --platform linux/amd64 -f ./Dockerfile -t sample-flask .

# aws copy to Dockerrun.aws.json to s3
aws s3 cp Dockerrun.aws.json s3://{BUCKET_NAME}/Dockerrun.aws.json