# create CSV version of mtcars dataset
data(mtcars)
write.csv(mtcars, "mtcars.csv", row.names = FALSE)
