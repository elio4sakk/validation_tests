# Write relevent tests for the function in here
# Consider the type of function:
#   - is it deterministic or statistic?
#   - is it worth checking for errors/warnings under particular conditions?

data(mtcars)
mtcars$cyl_f <- factor(mtcars$cyl)

cmod <- lm(mpg ~ cyl, data = mtcars)
fmod <- lm(mpg ~ cyl_f, data = mtcars)

test_that("lm returns the expected coefficients", {
  expect_equal(coef(cmod)[2], -2.88, tolerance = 0.01, ignore_attr = TRUE)
  
  means <- tapply(mtcars$mpg, mtcars$cyl, mean)
  coefs <- coef(fmod)
  expect_equal(coefs[1], means[1], ignore_attr = TRUE)
  expect_equal(coefs[2], means[2] - means[1], ignore_attr = TRUE)
  expect_equal(coefs[3], means[3] - means[1], ignore_attr = TRUE)
})

# write.csv(mtcars, "mtcars.csv", row.names = FALSE)
# reference software: Stata 17.0 (revision 2024-02-13)
# import delimited "mtcars.csv"
# regress mpg cyl
# 
#       Source |       SS           df       MS      Number of obs   =        32
# -------------+----------------------------------   F(1, 30)        =     79.56
#        Model |  817.712952         1  817.712952   Prob > F        =    0.0000
#     Residual |  308.334235        30  10.2778078   R-squared       =    0.7262
# -------------+----------------------------------   Adj R-squared   =    0.7171
#        Total |  1126.04719        31  36.3241028   Root MSE        =    3.2059
# 
# ------------------------------------------------------------------------------
#          mpg | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
# -------------+----------------------------------------------------------------
#          cyl |   -2.87579   .3224089    -8.92   0.000    -3.534237   -2.217343
#        _cons |   37.88458   2.073844    18.27   0.000     33.64922    42.11993
# ------------------------------------------------------------------------------
# regress mpg i.cyl
# 
#       Source |       SS           df       MS      Number of obs   =        32
# -------------+----------------------------------   F(2, 29)        =     39.70
#        Model |   824.78459         2  412.392295   Prob > F        =    0.0000
#     Residual |  301.262597        29  10.3883654   R-squared       =    0.7325
# -------------+----------------------------------   Adj R-squared   =    0.7140
#        Total |  1126.04719        31  36.3241028   Root MSE        =    3.2231
# 
# ------------------------------------------------------------------------------
#          mpg | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
# -------------+----------------------------------------------------------------
#          cyl |
#           6  |  -6.920779   1.558348    -4.44   0.000    -10.10796   -3.733599
#           8  |  -11.56364   1.298623    -8.90   0.000    -14.21962   -8.907653
#              |
#        _cons |   26.66364   .9718008    27.44   0.000     24.67608    28.65119
# ------------------------------------------------------------------------------

test_that("Standard errors from lm are correct", {
  expect_equal(summary(cmod)$coefficients[2, 2], 0.322408, 
               tolerance = 0.0001)
  expect_equal(summary(fmod)$coefficients[2, 2], 1.558348, 
               tolerance = 0.0001)
  expect_equal(summary(fmod)$coefficients[3, 2], 1.298623, 
               tolerance = 0.0001)
})
