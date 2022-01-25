##' @title Convenience wrapper for knitr::kable() et al
##'
##' @description Convenience wrapper for knitr::kable() designed to handle styling contingent upon output type (pdf vs. html). In addition to kable(), this wraps several other functions: kableExtra::pack_rows(), kableExtra::kable_styling(), kableExtra::column_spec().
##'
##' @details Convenience wrapper for knitr::kable() designed to handle styling contingent upon output type (pdf vs. html). Allows separate formatting options depending on output document type.
##'
##' @param content A data.frame or similar holding table content. It will be passed to kable().
##' @param out_type The output type of the table. Specially handled values are "html", "pdf", which yield tables in html or latex/pdf format, respectively. Any other value will yield a 'pandoc' table. See 'format' argument to kable().
##' @param digits Number of digits to right of decimal. See same name argument to kable().
##' @param caption The table caption. See same name argument to kable().
##' @param booktabs Enable latex package 'booktabs'. See same name argument to kable().
##' @param longtable Enable latex package 'longtable'. See same name argument to kable().
##' @param group_labels Labels assigned to groups of table rows. See kableExtra::pack_rows().
##' @param group_starts Start of each group of table rows. See kableExtra::pack_rows().
##' @param group_ends Start of each group of table rows. See kableExtra::pack_rows().
##' @param bootstrap_options Used for html tables. See kableExtra::kable_styling().
##' @param latex_options Used for pdf tables. See kableExtra::kable_styling().
##' @param full_width Should table be full page width? See kableExtra::kable_styling()
##' @param font_size Font size. See kableExtra::kable_styling()
##' @return A formated table, per knitr::kable().
##' @importFrom kableExtra pack_rows kable_styling column_spec
##' @importFrom knitr kable
##' @importFrom dplyr %>%
##' @export
##' @seealso kable(), kable_styling(), pack_rows(), column_spec().
##' @author David Braze \email{davebraze@@gmail.com}
format_table <- function(content, out_type, digits=2, caption=" ", ## args to kable()
                          booktabs=TRUE,  longtable=FALSE,      ## args to kable()
                          group_labels=NULL, group_starts=NULL, group_ends=NULL, ## args to pack_rows() via subtables()
                          ## args to kable_styling
                          bootstrap_options=c("striped", "condensed"),
                          latex_options=c("basic", "HOLD_position"),
                          full_width=FALSE,
                          font_size=10) {

    if (length(group_labels) != length(group_starts) ||
       length(group_starts) != (length(group_ends))) {
        stop("group_labels and group_starts and group_ends must all be the same length.")
    }

    ## function to help lay out subtables using kableExtra::pack_rows()
    subtables <- function(kable_table, group_labels, group_starts, group_ends) {
        if (is.null(group_labels)) return(kable_table)
        retval <- kable_table
        for (i in 1:length(group_labels)) {
            retval <- pack_rows(retval,
                                group_labels[i],
                                group_starts[i],
                                group_ends[i])
        }
        retval
    }

    if (out_type=="html") {
        ## format a table for html output.
        content %>%
            knitr::kable(format="html",
                  digits=digits,
                  caption=caption) %>%
            kable_styling(bootstrap_options=bootstrap_options,
                          full_width=full_width,
                          font_size=font_size) %>%
            column_spec(1, bold=TRUE) %>%
            subtables(group_labels, group_starts, group_ends)
    } else if (out_type=="pdf") {
        ## format a table for pdf output via latex
        content %>%
            knitr::kable(format="latex",
                  digits=digits,
                  caption=caption,
                  booktabs=booktabs,
                  longtable=longtable) %>%
            kable_styling(latex_options=latex_options,
                          full_width=full_width,
                          font_size=font_size) %>%
            column_spec(1, bold=TRUE) %>%
            subtables(group_labels, group_starts, group_ends)
    } else {
        ## Mostly to get some output to docx files. NB. kableExtra::
        ## functions work only for html & latex.
        content %>%
            knitr::kable(format="pandoc", ## also consider "markdown"
                  digits=digits,
                  caption=caption)
    }
}
