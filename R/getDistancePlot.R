#' Hello, world!
#' @export
#' @import plotly
#' @importFrom stats cmdscale
#' @param distanceMatrix An input
#' @param clusterHierachy An input
#' @param clusterAssignment An input

getDistancePlot <- function(distanceMatrix, clusterHierachy, clusterAssignment){

  multDimScale <- as.data.frame(cmdscale(distanceMatrix, k = 2))
  colnames(multDimScale) <- c("Coord1", "Coord2")

  if (nrow(multDimScale) != length(clusterAssignment))
    warning("Number of observations does not match cluster assigments")

  multDimScale$Cluster <- factor(clusterAssignment)

  P <- plot_ly(multDimScale) %>%
    add_trace(x = ~Coord1, y = ~Coord2, mode="markers", color = ~Cluster)

  P
}
