# pedeai-lambda

Repository to provision AWS Lambda function onto an existing subnet/vpc using Terraform.

### How to use

With *terraform*, *Go* and *aws CLI* installed.

Build the program:

- `GOARCH=amd64 GOOS=linux go build -o bootstrap main.go`
- `zip deployment.zip bootstrap`

Configure aws credentials:

- edit `~/.aws/credentials` file

To create Lambda Function:

- `terraform init` to initialize
- `terraform plan` to plan deploy
- `terraform apply` to create resources

To destroy:

- `terraform destroy` to destroy resources