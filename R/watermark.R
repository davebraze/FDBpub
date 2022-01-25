##' @title Watermark ggplot with "DRAFT"
##'
##' @description Watermark ggplot with "DRAFT" or other text.
##'
##' @details Watermark ggplot with "DRAFT" or other text.
##'
##' @param gg A ggplot object to be watermarked.
##' @param label Text to use as watermark. Defaults to "DRAFT".
##' @param size Text size in points. Defaults to 108.
##' @param color Watermark color. Defaults to "black".
##' @param alpha Watermark transparency. Defaults to 0.1.
##' @param angle Watermark angle. Defaults to 45°.
##' @param x x position of label. Defaults to 0.5.
##' @param y y position of label. Defaults to 0.5.
##' @param ... Arguments passed to cowplot::draw_label()
##' @importFrom cowplot ggdraw draw_label
##' @export
##' @return A ggplot2 object.
##' @author Dave Braze \email{davebraze@@gmail.com}
watermark <- function(gg,
                      label="DRAFT",
                      size=108,
                      color="black",
                      alpha=0.1,
                      angle=45,
                      x = 0.5,
                      y = 0.5,
                      ...)
{


    ## wisc5.plt + cowplot::draw_text("DRAFT", size = 36, alpha = .1, angle=45, y=100, x=2.5)

    ## cowplot::ggdraw(wisc5.plt) +
    ##     cowplot::draw_label("Draft", color = "black", alpha = 0.1, size = 100, angle = 45)

    ggdraw(gg) +
        draw_label(gg,
                   label = label,
                   size = size,
                   color = color,
                   alpha = alpha,
                   angle = angle,
                   x=x, y=y,
                   ...)

}


## tmp <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

##     watermark(tmp)
