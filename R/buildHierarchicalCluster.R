#' Perform Hierarchical Clustering on Data
#' @name buildHierarchicalCluster
#' @export
#' @import utils
#' @importFrom stats dist hclust
#' @importFrom dplyr select
#' @param dataset An input dataset
#' @param distanceMethod A dsitane method applicable for dist
#' @param linkageMethod A linkage method applicable for hclust

# Issue https://github.com/r-lib/tidyselect/issues/201, if where() is used in package use following
# utils::globalVariables("where")

buildHierarchicalCluster <- function(dataset, distanceMethod = "euclidean", linkageMethod = "complete") {
  # Generate distance matrix an cluster hierarchy (input should by already scaled if required)
  distM <- dist(dataset, method = distanceMethod)
  cHierarchy <- hclust(distM, method = linkageMethod)
  # Return both objects as a list
  list("distM" = distM, "cHierarchy" = cHierarchy)
}
