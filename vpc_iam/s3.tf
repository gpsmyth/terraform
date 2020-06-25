resource "aws_s3_bucket" "b" {
  bucket = "gpsbucket-uuids-qaz1"
  acl    = "private"

  # tags = {
  #   # Name = "gpsbucket-uuid"
  #   Name = var.s3tag
  #   uuid = var.s3uuid
  #   # uuid = "Udcv-ssbQfSV9t8ZHlPLbA"
  # }
  # tags = var.s3_tags
  tags = merge(map( 
            "Special_Key", "some special value", 
        ), var.s3_tags)
}

