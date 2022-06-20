#' Generate a Plotly Visualization of a Distance Matrix
#' @export
#' @import plotly
#' @importFrom stats cmdscale
#' @param distanceMatrix Observations summarized in a distance matrix
#' @param clusterAssignment Cluster assignments matching the observations

getDistancePlot <- function(distanceMatrix, clusterAssignment){

  # cmdscale returns a set of points such that the distances between the points are approximately equal to the dissimilarities
  multDimScale <- as.data.frame(cmdscale(distanceMatrix, k = 2))
  colnames(multDimScale) <- c("Coord1", "Coord2")

  # Test for weak point (R would simply reuse the same vector without an error otherwise)
  if (nrow(multDimScale) != length(clusterAssignment))
    warning("Number of observations does not match cluster assigments")

  multDimScale$Cluster <- factor(clusterAssignment)

  # Return a plotly visualization as output
  P <- plot_ly(multDimScale) %>%
    add_trace(x = ~Coord1, y = ~Coord2, mode="markers", color = ~Cluster)

  P
}
