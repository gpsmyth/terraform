output "topic-us-west" {
  value = aws_sns_topic.topic-us-west.arn
  # value = aws_sns_topic.name.arn
  description = "The value of the sns topic arn."
}

output "topic-us-east" {
  value = aws_sns_topic.topic-us-east.arn
  description = "The value of the sns topic arn."
}

# output "arn" {
#   value = aws_sns_topic.topic-us-east.arn
#   description = "The value of us-east-1 sns topic arn."
# }