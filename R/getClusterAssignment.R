#' Hello, world!
#' @export
#' @importFrom stats cutree
#' @param clusterHierachy An input
#' @param nCluster An input

getClusterAssignment <- function(clusterHierachy, nCluster) {
  cutree(clusterHierachy, k = nCluster)
}
