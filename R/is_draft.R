##' @title Is this a draft document?
##'
##' @description Return value of YAML directive "draft:"
##'
##' @details
##' For use in Rmarkdown documents. Return value of YAML directive "draft:", either \code{true} or \code{false}.
##'
##' Will return FALSE if "draft:" directive does not exist in rmarkdown file.
##'
##' Will return FALSE if value of "draft:" directive is not a logical value (true or false).
##'
##' @return Logical value: TRUE or FALSE.
##' @importFrom rmarkdown metadata
##' @export
##' @author Dave Braze \email{davebraze@@gmail.com}
##' @seealso \code{\link[rmarkdown]{metadata}}
##' @examples
##'
##' ## May be used to conditionally watermark ggplots
##' library(ggplot2)
##' data(iris)
##' tmp <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
##'   geom_point()
##'
##' if (is_draft()) {watermark(tmp)} else {tmp}
##'
##' ## If called from within YAML block use FDBpub::is_draft().
##' FDBpub::is_draft()
##'

is_draft <- function() {

    retval <- rmarkdown::metadata$draft

    if(is.null(retval)) return(FALSE)

    if(is.logical(retval)) return(retval) else return(FALSE)

}
