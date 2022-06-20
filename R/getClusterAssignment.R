#' Assign Hard Clusters for Cluster Tree
#' @export
#' @importFrom stats cutree
#' @param clusterHierachy A hierarchical cluster
#' @param nCluster Number of clusters requested

getClusterAssignment <- function(clusterHierachy, nCluster) {
  # Cut cluster hierarchy, to get specific number of clusters
  # Separation of these functions could make (future) calculation of cluster validity measures,
  # such as a classical elbow plot more efficient
  cutree(clusterHierachy, k = nCluster)
}
