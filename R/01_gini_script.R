# Load data ---------------------------------------------------------------

df <- read.csv("data-raw/microdata.csv", stringsAsFactors = FALSE)

measure <- df$welfare
weight  <- df$weight

# Compute gini index ------------------------------------------------------

delta_measure        <- measure * weight
sum_weighted_measure <- sum(delta_measure, na.rm = TRUE)
cum_measure          <- 0
cum_weight           <- 0
area_below_lorenz    <- 0

for (i in seq_along(measure)) {

  area_below_lorenz <- area_below_lorenz + (cum_measure + delta_measure[i] / 2) * weight[i]
  cum_weight        <- cum_weight + weight[i] # Cumulative weight
  cum_measure       <- cum_measure + delta_measure[i] # Cumulative weighted measure

}

gini = 1 - area_below_lorenz / cum_weight / sum_weighted_measure * 2
