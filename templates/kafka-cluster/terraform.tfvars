environments = {
  test = {
    name           = "example"
    create_cluster = "true"
    environment    = "test"
    availability   = "SINGLE_ZONE"
    cloud          = "AWS"
    region         = "us-east-2"
    cluster_type   = "basic"
  }
  prod = {
    name           = "example"
    create_cluster = false
    environment    = "prod"
    availability   = "SINGLE_ZONE"
    cloud          = "AWS"
    region         = "us-east-2"
    cluster_type   = "basic"
  }
}