
## Challenge 3

This challenge focuses on implementing a multi-provider configuration using Terraform modules and AWS services. 

### Base Task

The following important resource-related code is configured in the `base-folder`:

| Resource | Description | 
| :---        |    :----:   | 
| `EC2FullAccess` IAM Role  | Provides Full Access to EC2 service.      | 
| `IAMFullAccess` IAM Role | Provides Full Access to IAM service.   | 
| `ReadOnlyRole` IAM Role | Provides Read Only Access to Necessary Services.   | 
| `kplabs-challenge3-user` | Ability to Assume `EC2FullAccess` and `IAMFullAccess` Roles in AWS Account    | 
| `ro-user` | Ability to Assume `ReadOnlyRole` IAM Role in AWS Account    

Run the `terraform init && terraform apply -auto-approve` to create necessary resource before proceeding to Task 1.

### Tasks:

#### 1. Split Resource into Child Modules

Split (Move) the below mentioned resources from `challenge-3.tf` (not base folder) into child modules as described in below table. Each child module must be inside the `modules` folder.

| Resource Type  | Child Module Folder | 
| :---        |    :----:   | 
| `aws_launch_template`  | asg      | 
| `aws_autoscaling_group`  | asg   | 
| `aws_iam_user` | iam    | 
| `aws_iam_user_policy` | iam    | 

Configure the appropriate module sources in the root module (challenge-3.tf) to load all child modules.

#### 2. Create Shared Config and Credentials File

Set up a shared AWS credentials and configuration files for this project.

* The `conf` and `credentials` file must be present in the `.aws` folder in `challenge-3` directory. 

* The config file must only have two profiles `[asg]` and `[iam]`. No default or other profile should be mentioned.
* Use the region of `us-east-1` for both the profiles.

* Both the `[asg]` and `[iam]` profile in `./aws/conf` file should point to appropriate IAM roles that were created in `base-folder` using following details:
```
 [asg] profile should point to ARN of IAM role named `EC2FullAccess` 
 [iam] profile should point to ARN of IAM role named `IAMFullAccess`
```

* The `[asg]` and `[iam]` profile MUST use credentials associated with `kplabs-challenge3-user` from `base-folder` to assume the necessary roles.

#### 3. Add Appropriate Provider Configuration

* ASG Child-Module must make use of `[asg]` profile.
* IAM Child-Module must make use of `[iam]` profile.

* `data.aws_caller_identity.local` MUST assume the `ReadOnlyRole` to fetch the data. Credentials of `ro-user` can be used for authentication.

#### 4. Deploy Resources

Run `terraform apply` command to deploy `local_file resource` first. No other resources should be created at this step. Verify if `txt` file with account number is created successfully. 

Run the `terraform apply -auto-approve` to create all other resources.

#### 5. Prevent Change of Desired Capacity

Change `desired_capacity` in Terraform code from `1` to `2`.

Add appropriate solution that ignores any changes made to `desired_capacity` so that only `1` EC2 instance runs as part of `desired_capacity` similar to the base code provided.

After you have applied the solution, try changing capacity for ASG resource to verify if Terraform plans to change/update it in actual resource.

### Destroy Infrastructure

Delete all the infrastructure created as part of this Lab.
