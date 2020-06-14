provider "aws" {
  version = "~> 2.24"
  region  = var.region
}

terraform providers
.
└── provider.aws ~> 2.24

> slice (var.mylist[0], 3, 2)
> Error: Invalid function argument

> slice (var.mylist[0], 2, 4)
[
  3,
  4,
]

> element(var.mylist[0], 0)
1

> var.AWS_REGION

> var.env
dev

> var.mynumber
12

> var.TorF
true

> var.AMIS
{
  "eu-west-1" = "my amis"
}
> var.AMIS[eu-west-1]
