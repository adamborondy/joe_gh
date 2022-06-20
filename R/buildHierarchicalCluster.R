#' Hello, world!
#' @name buildHierarchicalCluster
#' @export
#' @import utils
#' @importFrom stats dist hclust
#' @importFrom dplyr select
#' @param dataset An input
#' @param distanceMethod An input
#' @param linkageMethod An input

# Issue https://github.com/r-lib/tidyselect/issues/201
# utils::globalVariables("where")

buildHierarchicalCluster <- function(dataset, distanceMethod = "euclidean", linkageMethod = "complete") {
  distM <- dist(dataset, method = distanceMethod)
  cHierarchy <- hclust(distM, method = linkageMethod)
  list("distM" = distM, "cHierarchy" = cHierarchy)
}
