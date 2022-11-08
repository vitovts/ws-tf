# Deploying xx to AWS XXX with Terraform

Sets up the following AWS infrastructure:

- Networking:
    - VPC
    - Public and private subnets
    - Routing tables
    - Internet Gateway
    - Key Pairs
- Security Groups
- Load Balancers, Listeners, and Target Groups
- IAM Roles and Policies
- ECS:
    - Task Definition (with multiple containers)
    - Cluster
    - Service
- Launch Config and Auto Scaling Group
- RDS
- Health Checks and Logs

## Want to use this project?

1. Install Terraform
    MacOS > brew install awscli terraform

2. Sign up for an AWS account

3. Configure user for connect awscli

4. Set the following environment variables, init Terraform, create the infrastructure:

    ```sh
    $ git clone git clone ssh://...
    $ cd dp-repo-tf
    $ export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
    $ export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"

    $ terraform init
    $ terraform plan
    $ terraform apply -refresh-only
    $ terraform apply
    $ cd ..
    ```

5. 