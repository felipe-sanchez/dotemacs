options(repos=structure(c(CRAN="http://cran.revolutionanalytics.com")))

library(stringr)
library(compiler)
library(magrittr)
library(foreach)
library(ggplot2)
library(doParallel)
registerDoParallel()
source("~/Projects/rutils/utils.r")

invisible(setCompilerOptions(suppressAll=TRUE))
invisible(enableJIT(2))
options(max.print = 100)


plot.log.x <- function(x, ...) {
    m <- floor(log10(min(x)))
    M <- ceiling(log10(max(x)))
    l <- list(...)
    
    tickn <- ceiling((M-m)/5)
    if (!is.null(l$tickn)) tickn <- l$tickn
    
    ticks <- seq(m, M, by=tickn)
    labels <- sapply(ticks, function(i) as.expression(bquote(10^ .(i))))

    plot(x, ..., xaxt='n')
    axis(1, at=10^ticks, labels=labels)
}

plot.log.y <- function(x, y, ...) {
    m <- floor(log10(min(y)))
    M <- ceiling(log10(max(y)))

    l <- list(...)
    
    tickn <- ceiling((M-m)/5)
    if (!is.null(l$tickn)) tickn <- l$tickn
    ticks <- seq(m, M, by=tickn)
    labels <- sapply(ticks, function(i) as.expression(bquote(10^ .(i))))

    plot(x, y, ..., yaxt='n')
    axis(2, at=10^ticks, labels=labels)
}

plot.log <- function(x, y, ...) {
    my <- floor(log10(min(y)))
    My <- ceiling(log10(max(y)))
    mx <- floor(log10(min(y)))
    Mx <- ceiling(log10(max(y)))

    l <- list(...)
    
    ticknx <- ceiling((Mx-mx)/5)
    if (!is.null(l$ticknx)) ticknx <- l$ticknx
    tickny <- ceiling((My-my)/5)
    if (!is.null(l$tickny)) tickny <- l$tickny
    
    ticksx <- seq(mx, Mx, by=ticknx)
    labelsx <- sapply(ticksx, function(i) as.expression(bquote(10^ .(i))))
    ticksy <- seq(mx, Mx, by=ticknx)
    labelsy <- sapply(ticksy, function(i) as.expression(bquote(10^ .(i))))

    plot(x, y, ..., xaxt='n', yaxt='n')
    axis(1, at=10^ticksx, labels=labelsx)
    axis(2, at=10^ticksy, labels=labelsy)
}



systemic <- function() {
    source("~/Projects/Systemic2/R/systemic.r", chdir=TRUE)
}

capply <- function(...) {
    l <- sapply(...)
    return(Filter(Negate(is.null), x))
}

scale_xy_log10 <- function() {
    return(
        scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                      labels = trans_format("log10", math_format(10^.x)), limits=c(1e-4, 30)) +
                      annotation_logticks(base = 10, sides = "bl", alpha=0.25)
    )
}

cat(getwd(), '\n')
