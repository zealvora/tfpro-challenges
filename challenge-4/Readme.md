
## Challenge 4

This challenge tests your ability to work with external data files, loop through data, and dynamically create AWS resources using Terraform.


### Task 1 - Create EC2 instance

Based on the contents of `ec2.csv` file, create an EC2 instance based on following conditions:

1. Only create EC2 instance if Region is `us-east-1`.

2. Inside `aws_instance` resource type, `count` and `count.index` should be used for iterating/looping over data. `for_each` or `for expression` should not be used inside `aws_instance` resource type. You are free to use it elsewhere. There should only be single `aws_instance` resource block in solution code.

3. Ensure that the `instance_type`, `ami_id`  are dynamically set based on the CSV file's content.

4. The following value of `instance_type`from CSV file should be replaced in `aws_instance` resource type based on the below requirement.

| Value from CSV  | Actual Value to be Added | 
| :---        |    :----:   | 
| `micro`  | t2.micro      | 
| `nano`  | t3.nano   | 

5. Map the `Team_Name` value from CSV to the EC2 instance's `Name` tag.

### Task 2 - Output Values

Create output values that display the following information for each created EC2 instance:

```sh
Instance ID
Region
Team name
Instance type
Subnet ID
Security Group ID (firewall_id)
```

Sample output value has been provided. The formatting of your output value should be similar. The values can change.

```sh
running_ec2 = [
  {
    "firewall_id" = toset([
      "sg-06dc77ed59c310f03",
    ])
    "id" = "i-0167b045e08b6ffee"
    "region" = "us-east-1"
    "subnet" = "subnet-0ad852475eaf6952c"
    "team" = "Security"
    "type" = "micro"
  },
  # Additional instances data...
]
```
