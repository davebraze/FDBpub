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
doc_type <- function()
{
    out_type <- "other"
    if (knitr::is_html_output()) {
        out_type <- "html"
    } else if (knitr::is_latex_output()) {
        out_type <- "pdf"
    }
}
