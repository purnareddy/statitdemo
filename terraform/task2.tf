resource "aws_sns_topic" "file_upload_topic" {
  name = "file-upload-topic"
  policy = <<POLICY
    {
        "Version":"2012-10-17",
        "Statement":[{
            "Effect": "Allow",
            "Principal": { "Service": "s3.amazonaws.com" },
            "Action": "SNS:Publish",
            "Resource": "arn:aws:sns:*:*:file-upload-topic",
            "Condition":{
                "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.statit_s3_bucket.arn}"}
            }
        }]
    }
    POLICY
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.file_upload_topic.arn
  protocol  = "email"
  endpoint  = "c.purnachander@gmail.com"
}

resource "aws_s3_bucket_notification" "trigger_notification" {
  bucket = aws_s3_bucket.statit_s3_bucket.id

  topic {
    topic_arn     = aws_sns_topic.file_upload_topic.arn
    events        = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }
}