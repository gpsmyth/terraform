```
provider "aws" {
  version = "~> 2.24"
  region  = var.region
}
```

```
terraform providers
.
└── provider.aws ~> 2.24
```

From `terraform console`  
`slice (var.mylist[0], 3, 2)`

> Error: Invalid function argument

`slice (var.mylist[0], 2, 4)`

```
> [
> 3,
> 4,
> ]
```

`element(var.mylist[0], 0)`
1

`var.AWS_REGION`

`var.env`

> dev

`var.mynumber`

> 12

`var.TorF`

> true

```
var.AMIS
{
 "eu-west-1" = "my amis"
}
var.AMIS[eu-west-1]
```

`lookup(var.AMIS,var.AWS_REGION)`
use1

```
> var.AMIS
{
  "eu-west-1" = "my amis"
  "eu-west-2" = "eu-w2"
  "us-east-1" = "use1"
}
> var.AWS_REGION
us-east-1
```

```
 replace("Hi you're working with a H string!", "H", "!" )
!i you're working with a ! string!
```

<!-- Do smoe regex examples -->
<!-- https://www.terraform.io/docs/configuration/functions/regex.html -->