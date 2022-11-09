resource "aws_iam_group_membership" "administrators" {
  name = "group-membership-administrators"
  users = [
    aws_iam_user.user1.name
  ]
  group = aws_iam_group.administrators.name
}
resource "aws_iam_group_membership" "console_users" {
  name = "group-membership-console-users"
  users = [
    aws_iam_user.user3.name
  ]
  group = aws_iam_group.console_users.name
}
resource "aws_iam_group_membership" "developers" {
  name = "group-membership-developers"
  users = [
    aws_iam_user.user2.name
  ]
  group = aws_iam_group.developers.name
}
