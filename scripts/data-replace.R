data.replace <- function(datavector, to, from) {
  datavector[datavector %in% from] <- to
  datavector
}
