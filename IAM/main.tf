provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "S3user" {
    name = "Kunle"  
}

resource "aws_iam_policy" "CustomPolicy" {
    name = "GlacierS3user"
 
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutAccessPointPolicyForObjectLambda",
                "s3:ListBucketMultipartUploads",
                "s3:PutBucketPublicAccessBlock",
                "s3:DeleteStorageLensConfigurationTagging",
                "s3:ListBucketVersions",
                "s3:PutStorageLensConfigurationTagging",
                "s3:PutJobTagging",
                "s3:ListBucket",
                "s3:DeleteBucketPolicy",
                "s3:DeleteJobTagging",
                "s3:DeleteAccessPointPolicyForObjectLambda",
                "s3:PutBucketTagging",
                "s3:PutBucketAcl",
                "s3:PutBucketPolicy",
                "s3:DeleteAccessPointPolicy",
                "s3:PutAccessPointPolicy"
            ],
            "Resource": [
                "arn:aws:s3:::*",
                "arn:aws:s3:*:890273741585:job/*",
                "arn:aws:s3:*:890273741585:storage-lens/*",
                "arn:aws:s3:*:890273741585:accesspoint/*",
                "arn:aws:s3-object-lambda:*:890273741585:accesspoint/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObjectTagging",
                "s3:ObjectOwnerOverrideToBucketOwner",
                "s3:PutObjectVersionAcl",
                "s3:ReplicateTags",
                "s3:PutObjectVersionTagging",
                "s3:PutObjectTagging",
                "s3:DeleteObjectVersionTagging",
                "s3:BypassGovernanceRetention",
                "s3:PutObjectAcl",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": "arn:aws:s3:::*/*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "s3:ListStorageLensConfigurations",
                "s3:PutAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:ListJobs"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}

resource "aws_iam_policy_attachment" "PolicyAttachement" {
    name = Attachment 
    users = [aws_iam_user.S3user.name]
    policy_arn = aws_iam_policy.CustomPolicy.arn
  
}