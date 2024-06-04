library(stats)
library(testthat)
local_edition(3) # use testthat 3rd edition syntax (waldo)
withr::defer({
  # most of the time, we would want to detach packages, in this case we don't
  # detach(package:stats)
}, teardown_env())
