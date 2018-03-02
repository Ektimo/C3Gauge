#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
C3Gauge <- function (message, width = NULL, height = NULL, arcWidth = NULL, minV=0,maxV=100, obrni=FALSE, text = '', values_all=c(0.50, 0.70, 0.90, 1), colors_all = c('#FF0000', '#F97600', '#F6C600', '#60B044'))
{
  # colors_all <- c('#FF0000', '#F97600', '#F6C600', '#60B044')
  # values_all <- c(0.50, 0.70, 0.90, 1)
  # if (length(values_all) != 4) {
  # values_all <- rep(values_all,4)[1:4]
  # warning("values_all recycled..count to 4!")
  # }
  if (obrni) colors_all <- rev(colors_all)

  # browser()
  v <- (message-minV)/(maxV-minV)
  indx <- first(which(v <= values_all))
  if (is.na(indx)) indx <- length(values_all)

  x = list(data = list(data = message), width = arcWidth,min=minV, max=maxV, color=colors_all[indx] , value = text)
  htmlwidgets::createWidget(name = "C3Gauge", x, width = width,
                            height = height, package = "C3")
}

#' Shiny bindings for C3Gauge
#'
#' Output and render functions for using C3Gauge within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3Gauge
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3Gauge-shiny
#'
#' @export
C3GaugeOutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3Gauge', width, height, package = 'C3')
}

#' @rdname C3Gauge-shiny
#' @export
renderC3Gauge <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3GaugeOutput, env, quoted = TRUE)
}
