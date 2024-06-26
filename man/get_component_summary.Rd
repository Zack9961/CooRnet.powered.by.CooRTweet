% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_component_summary.R
\name{get_component_summary}
\alias{get_component_summary}
\title{get_component_summary}
\usage{
get_component_summary(output, labels = FALSE)
}
\arguments{
\item{output}{the output list resulting from the function get_coord_shares}

\item{labels}{auto-generate a cluster label using account's title and
descriptions. Relies on Openai APIs. Expects the API Bearer in
OPENAI_API_KEY environment variable.}
}
\value{
A data frame that summarizes data for each coordinated component. The data includes:
\itemize{
\item The average number of subscribers of entities in a component.
\item The proportion of coordinated shares over the total shares (coorshare_ratio).
\item The average coordinated score (avg_cooRscore), which measures the dispersion (gini) in the distribution of domains that are coordinatedly shared by the component (0-1). Higher values correspond to higher concentration (fewer different domains linked).
\item The top coordinatedly shared domains (ranked by the number of shares) and the total number of coordinatedly shared domains.
If the NewsGuard API is provided, this function also returns an estimate of the trustworthiness of the domains used by the component. If the label parameter is set to TRUE and an OpenAI token is provided, the function also returns an automatically generated label for each component.
}
}
\description{
A function to get summary data by coordinated component
}
\details{
The gini values are computed by using the Gini coefficient on the proportions of unique domains each component shared. The Gini coefficient is a measure of the degree of concentration (inequality) of a variable in a distribution.
It ranges between 0 and 1: the more nearly equal the distribution, the lower its Gini index. When a component shared just one domain, the value of the variable is set to 1. It is calculated separately for full_domains (e.g. www.foxnews.com, video.foxnews.com) and parent domains (foxnews.com)

The cooRscore.avg is a measures of component coordination. Higher values implies higher coordination.
Its value is calculated by dividing, for each entity in a coordinated network, its \code{\link[igraph]{strength}} by its \code{\link[igraph]{degree}}, and then calculating the average by component of these values.

The cooRshare_ratio.avg is an addional measure of component coordination ranging from 0 (no shares coordinated) to 1 (all shares coordinated).
}
\examples{
  # get the top ten posts containing URLs shared by each network component and by engagement
  component_summary <- get_component_summary(output, label=TRUE)

  # clustering the components rowwise mutate
  clusters <- hclust(dist(component_summary[, 2:4]))
  plot(clusters)

}
