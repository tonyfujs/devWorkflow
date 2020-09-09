#' compute_gini
#' Computes gini coefficient
#'
#' @param df data.frame: Data frame containing variables for the gini computation
#' @param welfare_col character: Name of welfare column
#' For instance, income.
#' @param weight_col character: Name of weight column. In case each observation
#' represents a different proportion of the overall population
#'
#' @return numeric
#' @export
#'
#' @examples
#' welfare <- c(1, 5, 100)
#' weight <- c(.5, .3, .2)
#' df <- data.frame(welfare = welfare, weight = weight)
#' compute_gini(df)
compute_gini <- function(df,
                         welfare_col = "welfare",
                         weight_col  = "weight") {

  # Validate inputs
  check_inputs_compute_gini(df = df,
                            welfare_col = welfare_col,
                            weight_col = weight_col)

  delta_measure        <- df[[welfare_col]] * df[[weight_col]]
  sum_weighted_measure <- sum(delta_measure, na.rm = TRUE)
  cum_measure          <- 0
  cum_weight           <- 0
  area_below_lorenz    <- 0

  for (i in seq_along(df[[welfare_col]])) {

    area_below_lorenz <- area_below_lorenz + (cum_measure + delta_measure[i] / 2) * df[[weight_col]][i]
    cum_weight        <- cum_weight + df[[weight_col]][i] # Cumulative weight
    cum_measure       <- cum_measure + delta_measure[i] # Cumulative weighted measure

  }

  gini <- 1 - area_below_lorenz / cum_weight / sum_weighted_measure * 2

  return(gini)
}


#' check_inputs_compute_gini
#'
#' @param df data.frame: data.frame input to compute_gini()
#' @param welfare_col character: Name of welfare column
#' For instance, income.
#' @param weight_col character: Name of weight column. I
#'
#' @return logical
#'
check_inputs_compute_gini <- function(df, welfare_col, weight_col) {

  # CHECK data.frame input
  assertthat::assert_that(is.data.frame(df),
                          msg = glue::glue("'df' must be a data.frame vector. {df} is not a data.frame."))
  # CHECK column inputs
  assertthat::assert_that(is.numeric(df[[welfare_col]]),
                          msg = glue::glue("df${welfare_col} must be a numeric vector. df${welfare_col} is not numeric."))
  assertthat::assert_that(is.numeric(df[[weight_col]]),
                          msg = glue::glue("df${weight_col} must be a numeric vector. df${weight_col} is not numeric."))
  # CHECK sorting
  assertthat::assert_that(!is.unsorted(df[[welfare_col]]),
                          msg = glue::glue("df${welfare_col} must be sorted in increasing order"))
}
