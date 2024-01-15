require 'aws-sdk-ssm'

Aws::SSM::Client.new(region: 'us-east-2')

{
  "Statement": [
    {
      "Action": [
        "ssm:GetParameters"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:ssm:us-east-2:321745513113:parameter/<parameter_name>"
      ]
    }
  ],
  "Version": "2012-10-17"
}
