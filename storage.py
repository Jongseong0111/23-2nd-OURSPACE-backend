import boto3, uuid

class S3Client():
    def __init__(self, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY):
        self.s3 = boto3.client(
        's3',
        aws_access_key_id = AWS_ACCESS_KEY_ID,
        aws_secret_access_key = AWS_SECRET_ACCESS_KEY
        )

    def upload(self, image_file, directory, AWS_STORAGE_BUCKET_NAME):
        self.s3.upload_fileobj(
            image_file,
            AWS_STORAGE_BUCKET_NAME,
            'static/' +directory+"/"+str(uuid.uuid4()) + image_file.name,
            ExtraArgs = {
                'ContentType' : image_file.content_type
            }
        )
