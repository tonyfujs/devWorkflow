df <- read.csv("../testdata/microdata.csv", stringsAsFactors = FALSE)

benchmark <- 0.519568924911

test_that("compute_gini returns expected results", {
  expect_equal(compute_gini(df), benchmark)
})


test_that("Bad inputs are correctly identified", {
  expect_error(check_inputs_compute_gini(df = "df"))
  expect_error(check_inputs_compute_gini(df = df,
                                         welfare_col = "countrycode"))
  expect_error(check_inputs_compute_gini(df = df,
                                         weight_col  = "countrycode"))
})
