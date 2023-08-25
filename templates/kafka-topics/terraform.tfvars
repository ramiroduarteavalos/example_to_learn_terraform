project = "sarlanga"
  
environments = {
  test = {
    cluster = "example"
    environment = "test"
    create_topics = true
    topics = [
      {
        name = "sarlanga.product.normalized.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.saved.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.notify.v0"
      },
      {
        name = "sarlanga.product.dlq.v1"
      },
      {
        name = "sarlanga.msg.alert.v0"
      },
      {
        name = "sarlanga.product.received.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.validated.v0"
      },
      {
        name = "transactions.topic.product.received"
        exists = true
      },
      {
        name = "transactions.topic.notify.tracer"
        exists = true
      }
    ]

  }
  prod = {
    cluster = "example"
    environment = "prod"
    create_topics = true
    topics = [
      {
        name = "sarlanga.product.normalized.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.saved.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.notify.v0"
      },
      {
        name = "sarlanga.product.dlq.v1"
      },
      {
        name = "sarlanga.msg.alert.v0"
      },
      {
        name = "sarlanga.product.received.v0"
        partitions = 12
      },
      {
        name = "sarlanga.product.validated.v0"
      },
      {
        name = "transactions.topic.product.received"
        exists = true
      },
      {
        name = "transactions.topic.notify.tracer"
        exists = true
      }
    ]
  }
}
