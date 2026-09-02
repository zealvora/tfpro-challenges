
## Challenge 2

This challenge tests your understanding of Terraform Modules by requiring you to refactor a monolithic configuration into multiple child modules.



### Tasks:

#### 1. Deploy the Resources

Deploy all the resources by running `terraform init && terraform apply -auto-approve`

#### 2. Replace Hard Coded Value with Data Source

Use the `aws_ami` data source to replace the hardcoded AMI ID from the `aws_instance` resource type and fetch the value dynamically.

> [!CAUTION]
> The EC2 instance should not be recreated and it must use same AMI ID as Step 1.

#### 3. Split to Multiple Modules

Split (Move) the existing code into multiple child modules as described in below table. Each child module must be inside the `modules` folder.

| Resources  | Child Modules Folder Name | 
| :---        |    :----:   | 
| `aws_instance`,`aws_ami`  | ec2      | 
| `aws_security_group` | sg    | 
| `aws_vpc_security_group_ingress_rule` | sg    | 
| `aws_s3_bucket`  | s3        |
| `aws_s3_object`  | s3        |  
| `aws_iam_*`  | iam      | 
| `random_pet`  |  random      | 


* Do NOT modify the resource configuration code copied into the child modules.
* Configure appropriate module calls in the root module (main.tf) to load all child modules.
* Add appropriate variables in child modules.
* Add appropriate variable value in root module.

* Run the `terraform init` command to re-initialize. Ensure there are no errors.

#### 4. Temporarily Add Hardcoded Values

In places where string interpolation was used to fetch `random_pet` value, comment out the existing argument and manually hardcode the `random_pet` with actual value from state file.

Example:
```sh
# Replace this:
test = "${random_pet.name}"

# With this:
test = "hardcoded-value-from-state"
```
For EC2 instance, manually hardcode the final value of `instance_profile` that is part of state file and comment out the previous argument.

Ensure there are no errors when you run `terraform plan`

#### 5. Configure Addressing

Update the resource addresses using moved() blocks to reflect the refactoring of monolithic configuration into multiple child modules.

After completing previous step, run `terraform plan` and ensures there are no changes
```sh
Plan: 0 to add, 0 to change, 0 to destroy.
```
Ensure there are no warning message related to "Value for undeclared variable"


#### 6. Dynamic Value Implementation

Remove temporary hardcoded values that were added in Step 4 and implement proper module outputs:

* EC2 module: Should be able to fetch `iam_instance_profile` from IAM module
* IAM module: Should be able to fetch `random_pet` value from random module
* S3 module: Should be able to fetch `random_pet` value from random module
* The hardcoded values that were added in Step 4 needs to be removed.
  
Run `terraform apply` and ensure there are no changes.


#### 7. Destroy Infrastructure

Destroy all the created infrastructure with `terraform destroy -auto-approve`
