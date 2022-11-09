resource "aws_iam_group" "administrators" {
  name = "administrators"
  path = "/"
}
resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "console_users" {
  name = "console_users"
  path = "/"
}


data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
data "aws_iam_policy" "AmazonEC2FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


# ADMINISTRATORS
resource "aws_iam_group_policy_attachment" "administrator" {
  group = aws_iam_group.administrators.name
  policy_arn = data.aws_iam_policy.AdministratorAccess.arn
}
# DEVELOPERS
resource "aws_iam_group_policy_attachment" "developers_AmazonS3FullAccess" {
  group = aws_iam_group.developers.name
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
}
# EC2FullAccess
resource "aws_iam_group_policy_attachment" "developers_AmazonEC2FullAccess" {
  group = aws_iam_group.console_users.name
  policy_arn = data.aws_iam_policy.AmazonEC2FullAccess.arn
}
