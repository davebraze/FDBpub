##' @title Rmarkdown document output type
##'
##' @description Return the rmarkdown document output type as string.
##'
##' @details
##' For use in Rmarkdown documents. Returns the output document type as a string.
##'
##' @return Output document type as a string: "pdf", "html", or "other".
##' @export
##' @author Dave Braze \email{davebraze@@gmail.com}
##' @seealso \code{\link[knitr]{is_html_output}}
##' @examples
##' doc_type()
##'
doc_type <- function()
{
    retval <- "other"
    if (knitr::is_html_output()) {
        retval <- "html"
    } else if (knitr::is_latex_output()) {
        retval <- "pdf"
    }
    retval
}
