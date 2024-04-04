library(stats)
library(testthat)
withr::defer({
  # most of the time, we would want to detach packages, in this case we don't
  # detach(package:stats)
}, teardown_env())
