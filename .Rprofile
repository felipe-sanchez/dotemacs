options(repos=c(CRAN="http://cran.revolutionanalytics.com"))
library(MASS, quietly=TRUE)
library(tools, quietly=TRUE)
library(stringr, quietly=TRUE)
library(magrittr, quietly=TRUE)
library(foreach, quietly=TRUE)
library(ggplot2, quietly=TRUE)
#library(plyr, quietly=TRUE)
library(doParallel, quietly=TRUE)
#library(dplyr, quietly=TRUE)
library(DT, quietly=TRUE)
library(compiler)
registerDoParallel()
source("~/Projects/rutils/utils.r")
enableJIT(3)
setCompilerOptions(suppressAll=TRUE, suppressUndefined=TRUE)

options(max.print = 100)
theme_update(axis.title.x = element_text(vjust=0), axis.title.y = element_text(vjust=1, angle=90))


dots_names <- function(...) sapply( substitute(list(...)), deparse )[-1]

str_rep <- function(ch, times) str_c(rep(ch, times), collapse='')

cache <- function(exp, fn, dependencies=NULL) {
    depsfn <- str_c(fn, '.deps')
    if (file.exists(fn)) {
        if (is.null(dependencies) && !file.exists(depsfn))
            return(readRDS(fn))
        else {
            sums <- md5sum(dependencies)
            if (file.exists(str_c(fn, '.deps')) && all(readRDS(depsfn) == sums))
                return(readRDS(fn))
        }
    }

  ret <- force(exp)
    saveRDS(ret, fn)
    if (!is.null(dependencies)) {
        sums <- md5sum(dependencies)
        saveRDS(sums, depsfn)
    }
    return(ret)
}

echo <- function(...) {
    dnames <- dots_names(...)
    args <- list(...)
    stopifnot(length(args) > 0)
    max_length <- max(sapply(dnames, nchar)) 
    label_fmt <- str_c("%", max_length, "s |  ")
    value_pad <- sprintf(str_c("%", max_length, "s | "), "")

    out <- lapply(seq_along(dnames), function(i) {
        tc <- textConnection(str_c('echo__', runif(1)), open='w')
        label <- sprintf(label_fmt, dnames[[i]])
        
        sink(tc)
        print(args[[i]])
        sink(NULL)
        lines <- textConnectionValue(tc)        
        close(tc)
        return(list(label=label, lines=lines))
    })
    max_length_out <- max(sapply(out, function(l) max(sapply(l$lines, nchar))))
    lapply(out, function(l) {
        cat(l$label)
        cat(l$lines[1], '\n')
        if (length(l$lines) > 1) {
            sapply(l$lines[2:length(l$lines)], function(line) cat(value_pad, line, '\n'))
        }
        cat(value_pad, "\n")
    })
    invisible()
}

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


