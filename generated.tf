Certainly! Below is a simple Terraform configuration file to launch an EC2 instance of type `t2.micro` in AWS and associate it with a specific security group. This example assumes that you have already created a security group in your AWS account and you want to use its ID in the configuration.

You will need to replace `"YOUR_SECURITY_GROUP_ID"` with the actual ID of your security group and ensure that you have AWS credentials set up on your machine to allow Terraform to interact with your AWS account.

### Terraform Configuration (main.tf)

```hcl
provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the AMI ID you want to use
  instance_type = "t2.micro"
  
  # Ensure to replace this with your Security Group ID
  vpc_security_group_ids = ["YOUR_SECURITY_GROUP_ID"]

  # Optional: Add a key name for SSH access
  key_name = "your-key-pair" # Replace with your EC2 key pair name

  # Optional: To set the instance name, use tags
  tags = {
    Name = "MyEC2Instance"
  }
}
```

### Instructions to Use the Configuration

1. **Install Terraform**: Ensure you have Terraform installed on your machine.

2. **AWS Credentials**: Make sure your AWS credentials are configured. This can typically be done using the `aws configure` command of the AWS CLI, or by setting environment variables.

3. **Replace Values**:
   - Replace `"YOUR_SECURITY_GROUP_ID"` with the ID of the security group you wish to use.
   - Update the `ami` field with the appropriate AMI ID for your desired OS (e.g., Amazon Linux, Ubuntu). The example uses an Amazon Linux AMI placeholder.
   - Optionally, replace the `key_name` value with the name of your existing key pair for SSH access.

4. **Initialize Terraform**: Run the following command in the directory where your `main.tf` file is located:
   ```bash
   terraform init
   ```

5. **Plan the Deployment**: Generate and review the execution plan:
   ```bash
   terraform plan
   ```

6. **Apply the Configuration**: Launch the EC2 instance