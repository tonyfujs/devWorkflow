# Below is a script you have developed to compute a gini coefficient.
# You want to share it with your colleagues, and would like to turn this script
# into a function.

# Load data ---------------------------------------------------------------

df <- read.csv("data-raw/microdata.csv", stringsAsFactors = FALSE)

# Compute gini index ------------------------------------------------------

delta_measure        <- df$welfare * df$weight
sum_weighted_measure <- sum(delta_measure, na.rm = TRUE)
cum_measure          <- 0
cum_weight           <- 0
area_below_lorenz    <- 0

for (i in seq_along(df$welfare)) {

  area_below_lorenz <- area_below_lorenz + (cum_measure + delta_measure[i] / 2) * df$weight[i]
  cum_weight        <- cum_weight + df$weight[i] # Cumulative weight
  cum_measure       <- cum_measure + delta_measure[i] # Cumulative weighted measure

}

gini <- 1 - area_below_lorenz / cum_weight / sum_weighted_measure * 2

gini
