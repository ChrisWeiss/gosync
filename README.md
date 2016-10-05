GOSync
============
[gosync](https://github.com/weavenet/gosync) in a container.
Use this tool for moving files between the machines and S3 buckets.

# Usage Instruction
### Environment Variables you should inject
```
AWS_KEY=<YOUR AWS KEY>
AWS_SECRET=<YOUR AWS SECRET>
```

## Syncing from local directory to S3
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    -v ${LOCAL_FILE}:/files \
    anki/gosync
    gosync /files s3://bucket/files
```

## Syncing from S3 to local directory
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    -v ${LOCAL_FILE}:/files \
    anki/gosync
    gosync s3://bucket/files /files
```

## Syncing from S3 to S3
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    -v ${LOCAL_FILE}:/files \
    anki/gosync
    gosync s3://source_bucket s3://target_bucket
```

## Syncing from S3 to another directory in S3
```
    docker run \
    --env aws_key=${AWS_KEY} \
    --env aws_secret=${AWS_SECRET} \
    -v ${LOCAL_FILE}:/files \
    anki/gosync
    gosync s3://source_bucket/dir s3://target_bucket/another_dir
```

