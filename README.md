In our example we will create 3 users
```hcl

user1 - A administrator role
user2 - A Developer role
user3 - A Ec2 Admin role
```

Here we need to fill a accounts.txt file.
```hcl

# cat accounts.txt
#aws_account,keybase_account,group
user1,<keybase user>,administrators
user2, <keybase user>,developers
user3, <keybase user>,console_users
```

you need a account on https://keybase.io/.

![image](https://user-images.githubusercontent.com/25347806/200846998-22d241b0-1e57-40a0-8aaf-023c4681ab95.png)

 

If you need more informations about keybase take a look this vídeo, help me a lot -> https://www.youtube.com/watch?v=np4zD_F_dPc


Execute a ./user-add.sh, and after that execute the ./tfa.sh to create a users on AWS.
```hcl

# ./user-add.sh
Processed: user1
Processed: user2
Processed: user3
```
```hcl

[root@ip-172-31-86-48 terraform-aws-iam-keybase]# ./tfa.sh
Processed: user1
Processed: user2
Processed: user3
data.aws_iam_policy.AmazonEC2FullAccess: Reading...
data.aws_iam_policy.AmazonS3FullAccess: Reading...
data.aws_iam_policy.AdministratorAccess: Reading...
data.aws_iam_policy.AmazonEC2FullAccess: Read complete after 1s [id=arn:aws:iam::aws:policy/AmazonEC2FullAccess]
data.aws_iam_policy.AmazonS3FullAccess: Read complete after 1s [id=arn:aws:iam::aws:policy/AmazonS3FullAccess]
data.aws_iam_policy.AdministratorAccess: Read complete after 1s [id=arn:aws:iam::aws:policy/AdministratorAccess]
.
.
.
.
.
Apply complete! Resources: 21 added, 0 changed, 0 destroyed.
-rw-r--r-- 1 root root 0 Nov  9 13:38 /tmp/terraform-apply-2022-11-09_13:38.log
```

Now you can see a created users
 
 ![image](https://user-images.githubusercontent.com/25347806/200847049-94f33001-2637-4e5a-857d-2beecd7938b9.png)


Each user has a file with yours encrypt password.
```hcl

# ls -la encrypted_password.user*
-rw------- 1 root root 800 Nov  9 12:59 encrypted_password.user1.txt
-rw------- 1 root root 800 Nov  9 12:59 encrypted_password.user2.txt
-rw------- 1 root root 800 Nov  9 12:59 encrypted_password.user3.txt
```

And after that you execute ./decryptpass.sh and cat password.txt. you can see a password for users.
```hcl

# cat password.txt
user1    ;    Omh1Zq-G%D!tsq(5]9S
user2    ;    +nC7-9c@O7p)oReU7L]
user3    ;    *{ZQ}4D6Cg&g^A|))$]

```


## Requirements
| Name | Version |
| ---- | ------- |
| aws | ~> 2.8.3 |
| terraform | ~> v1.3.2 |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Description | Required | Type | Default |
|----- | ----------- | -------- | ---- | ------- |
| iam_user_login_profile | If you want to create a user login profile | `no` | `bool` | `true` |
| iam_access_key | If you want to create an IAM access key | `no` | `bool` | `true` |
| iam_https-git-credentials | If you want to attach Policy for access to the AWS Commit | `no` | `bool` | `true` |
| iam_user_ssh_key | If you want to import an SSH key | `no` | `bool` | `false` |
| iam_user_name | The name of the user who will create | `yes` | `string` | ` ` |
| force_destroy | When destroying this user, destroy even if he has IAM access keys not managed by Terraform | `no` | `bool` | `false` |
| permissions_boundary | The ARN of the policy used to set the permission limit for the user | `no` | `string` | `null` |
| path | The desired path for the IAM user | `no` | `string` | `/` |
| encoding | Specifies the encoding format of the public key to be used. To retrieve the public key in the ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM | `no` | `string` | `SSH
` |
| public_key | The SSH public key. The public key must be encoded in ssh-rsa format or in PEM format | `no` | `string` | ` ` |
| pgp_key | A base 64 encoded PGP public key or a keybase username in the key keybase: username. Used to encrypt password and access key. | `yes` | `string` | ` ` |
| password_length | The length of the generated password | `no` | `number` | `20` |
| password_reset_required | Whether the user should be forced to reset the password generated at first login | `no` | `bool` | `false` |
| default_tags | Tags to add to all resources | `yes` | `map` | `{ }` |


## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
| Name | Description |
| ---- | ----------- |
| iam_user | The user's name. |
| secret | The password of the user's. |
| access_key | The access key of the user's. |
| encrypted_password | The access secret of the user's. |
