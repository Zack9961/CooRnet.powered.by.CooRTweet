% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ctshares.R
\name{get_ctshares}
\alias{get_ctshares}
\title{get_ctshares}
\usage{
get_ctshares(
  urls,
  url_column,
  date_column,
  platforms = "facebook,instagram",
  nmax = 1000,
  sleep_time = 30,
  clean_urls = FALSE,
  get_history = TRUE,
  save_ctapi_output = FALSE
)
}
\arguments{
\item{urls}{a dataframe with at least a column "url" containing the URLs, and a column "date" with their published date}

\item{url_column}{string: name of the column (placed inside quote marks) where the URLs are stored (defaults to "url")}

\item{date_column}{string: name of the column (placed inside quote marks) where the date of the URLs are stored (defaults to "date")}

\item{platforms}{string: default to "facebook,instagram". You can specify only "facebook" to search on Facebook, or only "instagram" to search on Instagram}

\item{nmax}{integer: max number of results for query (default 1000 as per}

\item{sleep_time}{integer: pause between queries to respect API rate limits. Default to 30 secs, it can be lowered or increased depending on the assigned \href{https://help.crowdtangle.com/en/articles/3443476-api-cheat-sheet}{API rate limit}.}

\item{clean_urls}{logical: clean the URLs from tracking parameters (default FALSE)}

\item{save_ctapi_output}{logical: saves the original CT API output in ./rawdata/ct_shares.df.0.rds (default FALSE)}

\item{logical:}{get_history get historical engagement for each post. Used by draw_url_timeline_chart.R (default TRUE)}
}
\value{
a data.frame of posts that shared the URLs and a number of variables returned by the \href{https://github.com/CrowdTangle/API/wiki/Links}{CrowdTangle API links endpoint} and the original data set of news
}
\description{
A function to get the URLs shares from CrowdTangle
}
\details{
to start using the library you need to set the CrowdTangle API key.
Open the environment variable file with file.edit("~/.Renviron"), write CROWDTANGLE_API_KEY = <YOUR_API_KEY>, save the file and restart your current R session to start using the CrowdTangle API
}
\examples{
  df <- get_ctshares(urls, url_column=“url”, date_column=“date”, platforms="facebook,instagram", nmax=100, sleep_time=30, clean_urls=FALSE, save_ctapi_output=FALSE)

}
