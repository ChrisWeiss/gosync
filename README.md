S3CMD
============
S3cmd in a Docker container.
Use this tool for moving files between the machine and S3.

# Usage Instruction
### Environment Variables you should override
```
AWS_KEY=<YOUR AWS KEY>
AWS_SECRET=<YOUR AWS SECRET>
BUCKET=s3://url.to.s3.bucket/folder/
LOCAL_FILE=/path/to/files/or/folder/
```
## Copy from machine to S3:
* Change `LOCAL_FILE` to file/folder you want to upload to S3.
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    --env cmd=sync-local-to-s3 \
    --env DEST_S3=${BUCKET}  \
    -v ${LOCAL_FILE}:/opt/src \
    anki/s3cmd
```

## Copy from S3 to machine:
* Change `LOCAL_FILE` to the file/folder where you want to download the files from S3 to the machine.
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    --env cmd=sync-s3-to-local \
    --env SRC_S3=${BUCKET} \
    -v ${LOCAL_FILE}:/opt/dest \
    anki/s3cmd
```

## Run interactively with s3cmd
* Execute the `main.sh` script to setup the s3cmd config file once you're inside th contaner's shell. Then, execute the `s3cmd commands you'd like.`
```
    $ docker run -it \
      --env aws_key=${AWS_KEY} \
      --env aws_secret=${AWS_SECRET} \
      --env cmd=interactive \
      -v /:/opt/dest \
      anki/s3cmd /bin/sh
    $ /opt/main.sh
    $ s3cmd ls /
```
