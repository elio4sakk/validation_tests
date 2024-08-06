# Write relevent tests for the function in here
# Consider the type of function:
#   - is it deterministic or statistic?
#   - is it worth checking for errors/warnings under particular conditions?


data_sas <- read_sas("./skinproduct_attributes_seg.sas7bdat")
data_csv <- read.csv("./skinproduct_attributes_seg.csv", check.names = F)


#####################################
#####		compare content		#####
#####################################

#compare column 1
test_that("Column 1 matches"
	, expect_equal(
		sum(data_csv$ProductKey == data_sas$ProductKey, na.rm = T)
		, sum(complete.cases(data_sas$ProductKey))
	)
)

#compare column 2
test_that("Column 2 matches"
	, expect_equal(
		sum(data_csv$ProductName == data_sas$ProductName, na.rm = T)
		, sum(complete.cases(data_sas$ProductName))
	)
)

#compare column 3
test_that("Column 3 matches"
	, expect_equal(
		sum(data_csv$SupplierName == data_sas$SupplierName, na.rm = T)
		, sum(complete.cases(data_sas$SupplierName))
	)
)

#compare column 4
test_that("Column 4 matches"
	, expect_equal(
		sum(data_csv$ProductType == data_sas$ProductType, na.rm = T)
		, sum(complete.cases(data_sas$ProductType))
	)
)

#compare column 5
test_that("Column 5 matches"
	, expect_equal(
		sum(data_csv$Venue == data_sas$Venue, na.rm = T)
		, sum(complete.cases(data_sas$Venue))
	)
)

#compare column 6
test_that("Column 6 matches"
	, expect_equal(
		sum(data_csv$DistributionCenter == data_sas$DistributionCenter, na.rm = T)
		, sum(complete.cases(data_sas$DistributionCenter))
	)
)

#compare column 7
test_that("Column 7 matches"
	, expect_equal(
		sum(data_csv$ProductCategory == data_sas$ProductCategory, na.rm = T)
		, sum(complete.cases(data_sas$ProductCategory))
	)
)

#compare column 8
test_that("Column 8 matches"
	, expect_equal(
		sum(data_csv$`_seg_` == data_sas$`_seg_`, na.rm = T)
		, sum(complete.cases(data_sas$`_seg_`))
	)
)


#####################################
#####	check column names		#####
#####################################

test_that("Column names are correct", expect_equal(names(data_sas),names(data_csv)))


#####################################
#####	check column labels		#####
#####################################

l_labels <- lapply(data_sas, attr, "label")

test_that("Column 1 label is correct", expect_equal(l_labels$ProductKey, "Product Key"))
test_that("Column 2 label is correct", expect_equal(l_labels$ProductName, "Product Name"))
test_that("Column 3 label is correct", expect_equal(l_labels$SupplierName, "Supplier Name"))
test_that("Column 4 label is correct", expect_equal(l_labels$ProductType, "Product Type"))
test_that("Column 5 label is correct", expect_equal(l_labels$Venue, "Sale's Venue"))
test_that("Column 6 label is correct", expect_equal(l_labels$DistributionCenter, "Distribution Center"))
test_that("Column 7 label is correct", expect_equal(l_labels$ProductCategory, "Product Category"))
test_that("Column 8 label is correct", expect_equal(l_labels$`_seg_`, NULL))
