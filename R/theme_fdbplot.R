##' @title FDB's stock ggplot2 theme
##'
##' @description GGplot2 theme based on theme_gray().
##'
##' @details GGplot2 theme based on theme_gray().
##'
##' Use ggplot2::theme_update() to tweak this to specific client needs.
##'
##' @importFrom ggplot2 theme element_line element_rect element_text element_blank margin rel unit
##' @export
##' @author Dave Braze \email{davebraze@@gmail.com}
##' @param base_size Base font size in points. Defaults to 12.
##' @param base_family Base font family. No default.
##' @param base_line_size Base line width in points. Defaults to base_size/24.
##' @param base_rect_size Base line width for rectangles. Defaults to base_size/24.
##' @param rel_small Small font size. Defaults to 10/12.
##' @param rel_large Large font size. Defaults to 15/12.
theme_fdbplot <- function(base_size = 12, base_family = "",
                          base_line_size = base_size/24,
                          base_rect_size = base_size/24,
                          rel_small = 10/12,
                          rel_large = 15/12) {

    half_line <- base_size/2

    retval <- theme(complete = TRUE,
                    line = element_line(colour = "black", size = base_line_size,
                                        linetype = 1, lineend = "butt"),
                    rect = element_rect(fill = NA, colour = "black", size = base_rect_size, linetype = 1),
                    text = element_text(family = base_family, face = "plain",
                                        colour = "black", size = base_size, lineheight = 0.9,
                                        hjust = 0.5, vjust = 0.5, angle = 0, margin = margin(),
                                        debug = FALSE),
                    axis.line = element_line(lineend = "square"),
                    axis.line.x = NULL,
                    axis.line.y = NULL,
                    axis.text = element_text(size = rel(0.85 * rel_small)), # should this be codified as rel_v_small?
                    axis.text.x = element_text(margin = margin(t = 0.8 * half_line/2), vjust = 1),
                    axis.text.x.top = element_text(margin = margin(b = 0.8 * half_line/2), vjust = 0),
                    axis.text.y = element_text(margin = margin(r = 0.8 * half_line/2), hjust = 1),
                    axis.text.y.right = element_text(margin = margin(l = 0.8 * half_line/2), hjust = 0),
                    axis.ticks = NULL,
                    axis.ticks.length = unit(half_line/2, "pt"),
                    axis.ticks.length.x = NULL,
                    axis.ticks.length.x.top = NULL,
                    axis.ticks.length.x.bottom = NULL,
                    axis.ticks.length.y = NULL,
                    axis.ticks.length.y.left = NULL,
                    axis.ticks.length.y.right = NULL,
                    axis.title.x = element_text(margin = margin(t = half_line/2), vjust = 1),
                    axis.title.x.top = element_text(margin = margin(b = half_line/2), vjust = 0),
                    axis.title.y = element_text(angle = 90, margin = margin(r = half_line/2), vjust = 1),
                    axis.title.y.right = element_text(angle = -90, margin = margin(l = half_line/2), vjust = 0),
                    legend.background = element_blank(),
                    legend.spacing = unit(2 * half_line, "pt"),
                    legend.spacing.x = NULL,
                    legend.spacing.y = NULL,
                    legend.margin = margin(half_line, half_line, half_line, half_line),
                    legend.key = element_rect(fill = "grey20", colour = NA),
                    legend.key.size = unit(1.2, "lines"),
                    legend.key.height = NULL,
                    legend.key.width = NULL,
                    legend.text = element_text(size = rel(rel_small)),
                    legend.text.align = NULL,
                    legend.title = element_text(hjust = 0),
                    legend.title.align = NULL,
                    legend.position = "right",
                    legend.direction = NULL,
                    legend.justification = "center",
                    legend.box = NULL,
                    legend.box.margin = margin(0, 0, 0, 0, "cm"),
                    legend.box.background = element_blank(),
                    legend.box.spacing = unit(2 * half_line, "pt"),
                    panel.background = element_blank(),
                    panel.border = NULL,
                    panel.grid = element_line(color = "grey80", size = base_line_size),
                    panel.grid.major = NULL,
                    panel.grid.major.x = element_blank(),
                    panel.grid.major.y = NULL,
                    panel.grid.minor = element_line(color = "grey90", size = base_line_size*2/3),
                    panel.grid.minor.x = element_blank(),
                    panel.grid.minor.y = NULL,
                    panel.spacing = unit(half_line/2, "pt"),
                    panel.spacing.x = NULL,
                    panel.spacing.y = NULL,
                    panel.ontop = FALSE,
                    strip.background = element_rect(fill = "grey80", colour = NA),
                    strip.text = element_text(colour = "grey10",
                                              size = rel(rel_small),
                                              margin = margin(0.5 * half_line, 0.5 * half_line,
                                                              0.5 * half_line, 0.5 * half_line)),
                    strip.text.x = NULL,
                    strip.text.y = element_text(angle = -90),
                    strip.text.y.left = element_text(angle = 90),
                    strip.placement = "inside",
                    strip.placement.x = NULL,
                    strip.placement.y = NULL,
                    strip.switch.pad.grid = unit(half_line/2, "pt"),
                    strip.switch.pad.wrap = unit(half_line/2, "pt"),
                    plot.background = NULL,
                    plot.title = element_text(face = "bold", size = rel(rel_large),
                                              hjust = 0, vjust = 1,
                                              margin = margin(b = half_line)),
                    plot.title.position = "panel",
                    plot.subtitle = element_text(hjust = 0, vjust = 1,
                                                 margin = margin(b = half_line)),
                    plot.caption = element_text(size = rel(rel_small), hjust = 1, vjust = 1,
                                                margin = margin(t = half_line)),
                    plot.caption.position = "panel",
                    plot.tag = element_text(face="bold", size=rel(rel_large),
                                            hjust = 0.5, vjust = 0.5),
                    plot.tag.position = "topleft",
                    plot.margin = margin(half_line, half_line, half_line, half_line))

    retval
}
