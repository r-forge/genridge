\name{precision}
\alias{precision}
\alias{precision.ridge}
\alias{precision.lm}
\title{
Measures of Precision and Shrinkage for Ridge Regression
}
\description{
Calculates measures of precision based on the size of the 
estimated covariance matrices of the parameters and
shrinkage of the parameters in a ridge regression model.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{

precision(object, ...)

\method{precision}{ridge}(object, ...)
\method{precision}{lm}(object, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{object}{
An object of class \code{ridge} or \code{lm}
}
  \item{\dots}{
Other arguments (currently unused)
}

}
\details{
Three measures of (inverse) precision based on the \dQuote{size} of the
covariance matrix of the parameters are calculated. Let \eqn{V_k} be
the covariance matrix for a given ridge constant, and let
\eqn{\lambda_i , i= 1, \dots p} be its eigenvalues
\enumerate{
         \item \eqn{\log | V_k | = \log \prod \lambda} measures the (log) volume of the covariance ellipsoid
         and corresponds approximately to Wilks' Lambda criterion
         \item \eqn{ trace( V_k ) =  \sum \lambda} corresponds approximately to Pillai's trace criterion
         \item \eqn{ \lambda_1 =  max (\lambda)} corresponds approximately to Roy's largest root criterion.
       }

}
\value{
A data.frame with the following columns
%%  If it is a LIST, use
  \item{lambda}{The ridge constant}
  \item{df}{The equivalent effective degrees of freedom}
  \item{log.det}{The log determinant of the covariance matrix}
  \item{trace}{The trace of the covariance matrix}
  \item{max.eig}{Maximum eigen value of the covariance matrix}
  \item{norm.beta}{The root mean square of the estimated coefficients}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Michael Friendly
}
\note{
Models fit by \code{lm} and \code{ridge} use a different scaling for the
predictors, so the results of \code{precision} for an \code{lm} model
will not correspond to those for \code{ridge} with ridge constant = 0.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ridge}}, 
}
\examples{
longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)
coef(lridge)

(pdat <- precision(lridge))
with(pdat, plot(norm.beta, log.det, type="b"))


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{models}% __ONLY ONE__ keyword per line