# Terraform

As an open source tool, Terraform provides a flexible abstraction of resources and providers.

While configuration management tools such as Chef, Puppet, and Ansible install and manage software on a machine that already exists, Terraform is not a configuration management tool, and it allows existing tooling to focus on their strengths: bootstrapping and initializing resources.

## What is Terraform?  [here](https://www.terraform.io/intro/index.html) 

## Here are lists of Use cases for Terraform [here](https://www.terraform.io/intro/use-cases.html)

## Install Terraform [here](https://www.terraform.io/downloads.html)

terraform -version

## Terraform configuration
 - The set of files used to describe infrastructure in Terraform is simply known as a code 
 - The recommended format of the configuration files JSON 
 - Terraform will automatically search for saved API credentials in ~/.aws/credentials or IAM instance profile credentials:
	``` 
  aws_access_key_id = A..z
  aws_secret_access_key = A..z
	```
- The provider block is used to configure the named provider, in our case "aws"
	```
	provider "aws" {
  	region     = "us-east-1"
  	access_key = "A..z"
  	secret_key = "A..z"
	}
	```
## Terraform init
- The terraform init command is used to initialize a working directory containing Terraform configuration files. 
- This is the first command that should be run after writing a new Terraform configuration. 
- terraform init will initialize various local settings and data that will be used by subsequent commands.

terraform init
```
Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "aws" (1.39.0)...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 1.39"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running terraform plan to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Execution Plan

terraform plan shows what changes Terraform will apply to our infrastructure given the current state of our infrastructure as well as the current contents of our configuration.

## Apply
he plan looks good, our configuration appears valid, so it's time to create real resources

- Terraform also puts some state into the terraform.tfstate file by default.


## terraform show
## terraform validate


