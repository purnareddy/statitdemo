package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/aws"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestS3Bucket(t *testing.T) {

  awsRegion := "us-east-1"
  terraformOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
    TerraformDir: "../",
  })
  // defer terraform.Destroy(t, terraformOpts)
  // terraform.InitAndApply(t, terraformOpts)
  bucketID := terraform.Output(t, terraformOpts, "statit_s3_bucket_id")
  versioningStatus := aws.GetS3BucketVersioning(t, awsRegion, bucketID)
  assert.Equal(t, "Enabled", versioningStatus)
}