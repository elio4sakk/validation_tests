library(stats)
library(testthat)
withr::defer({
  detach(package:stats)
}, teardown_env())
