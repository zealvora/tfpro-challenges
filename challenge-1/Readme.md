
## Challenge 1

This challenge is designed to test your understanding of Terraform by requiring you to fix broken code, import resources, output values, and manage Terraform states effectively.

This challenge contains 8 tasks to test your ability with Terraform.

### Tasks:

#### 1. Fix the Broken Code

The provided Terraform code in this folder has syntax errors, resource misconfiguration, or other issues. Your goal is to fix these issues and deploy the resources successfully.

#### 2. Output the Values

Use the `output` block in Terraform to display the following values in the CLI:

* List of S3 Bucket names.
* List of IAM user names.
* Id of Security Group
* Id of Security Group Rules.

The format of the output values should look similar to the code below. The values can be different.

```sh
   s3_buckets = [
      + "fancy-mouse-kplabs-1",
      + "fancy-mouse-kplabs-2",
    ]

   sg_id      = "sg-05da12b59833d3732"
   sg_rule_id = "sgr-009eccddbf2a81873"

   user_names = [
      + "fancy-mouse-var.org-name-0",
      + "fancy-mouse-var.org-name-1",
      + "fancy-mouse-var.org-name-2",
    ]
```

#### 3. Store Output Values to File

Save the output values to files as per the below table

| Output Value of Object  | File Name | 
| :---        |    :----:   | 
| S3 Bucket Names   | s3.txt      | 
| IAM User Names | iam-users.txt    | 
| Security Group ID  | sg-combined.txt        | 
| VPC Ingress Rule ID  | sg-combined.txt       | 



#### 4. Delete the Resource and Files

* Remove the `aws_security_group` and `aws_vpc_security_group_ingress_rule` resource type related code from your Terraform configuration.

* Delete the `terraform.tfstate` file and its backup (terraform.tfstate.backup), if available.

#### 5. Import ALL resources

* Import all AWS resources created in Step 1 into a new Terraform state file. 

* Ensure the existing Terraform configuration matches the actual resources in AWS and that no actual resources are deleted.

#### 6. Create New Resource

* Create a new object in S3 bucket using `aws_s3_object`

* The name of the object must be `new.txt`

* The content of the object must be `Success`

#### 7. Remove Object from State

* Remove the S3 object code created in Step 1 named `base.txt` from the Terraform code and state file.
* Ensure this object is not deleted from AWS.

> [!CAUTION]
> The previous S3 object `base.txt` must not be deleted, othewise you will lose marks.


#### 8. Destroy all Resources

Destroy all resources created as part of this Challenge 1