% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{time_get}
\alias{time_get}
\title{Get components of a date-time object}
\usage{
time_get(
  time,
  components = c("year", "month", "yday", "mday", "wday", "hour", "minute", "second"),
  week_start = getOption("timechange.week_start", 1)
)
}
\arguments{
\item{time}{a date-time object}

\item{components}{a character vector of components to return. Component is
one of "year", "month", "yday", "day", "mday", "wday", "hour", "minute",
"second" where "day" is the same as "mday".}

\item{week_start}{week starting day (Default is 1, Monday). Set
\code{timechange.week_start} option to change this globally.}
}
\value{
A data.frame of the requested components
}
\description{
Get components of a date-time object
}
\examples{
x <- as.POSIXct("2019-02-03")
time_get(x)
}
