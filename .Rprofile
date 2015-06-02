options(repos=structure(c(CRAN="http://cran.revolutionanalytics.com")))

require(stringr)
require(compiler)


invisible(enableJIT(3))
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


logseq <- function(from=1, to=10, length.out=10) {
    return(10^seq(log10(from), log10(to), length.out=length.out))
}

`%.%` <- function(str1, str2) {
    return(paste(str1, str2, sep=''))
}

`%<>%` <- function(a, interval) {
    return(a >= min(interval) && a <= max(interval))
}


printf <- function(...) {
    cat(sprintf(...))
}

usePackage <- function(p) {
    if (!is.element(p, installed.packages()[,1]))
        install.packages(p, dep = TRUE)
    require(p, character.only = TRUE)
}

dpareto <- function(x, a=2.5, b=1) a*b^a/x^(a+1)
ppareto <- function(x, a=2.5, b=1) (x > b)*(1-(b/x)^a)
qpareto <- function(u, a=2.5, b=1) b/(1-u)^(1/a)
rpareto <- function(n, a=2.5, b=1) qpareto(runif(n),a,b)

# From http://stackoverflow.com/questions/20127282/r-color-scatterplot-points-by-z-value-with-legend
scatter_fill <- function (x, y, z,xlim=c(min(x),max(x)),ylim=c(min(y),max(y)),zlim=c(min(z),max(z)),
                          nlevels = 20, plot.title, plot.axes, log='',
                          key.title, key.axes, asp = NA, xaxs = "i", 
                          yaxs = "i", las = 1, 
                          axes = TRUE, frame.plot = axes, ...) 
{
  mar.orig <- (par.orig <- par(c("mar", "las", "mfrow")))$mar
  on.exit(par(par.orig))
  w <- (3 + mar.orig[2L]) * par("csi") * 2.54
  layout(matrix(c(2, 1), ncol = 2L), widths = c(1, lcm(w)))
  par(las = las)
  mar <- mar.orig
  mar[4L] <- mar[2L]
  mar[2L] <- 1
  par(mar = mar)

# choose colors to interpolate
levels <- seq(zlim[1],zlim[2],length.out = nlevels)
col <- colorRampPalette(c("red","yellow","dark green"))(nlevels)  
colz <- col[cut(z,nlevels)]  
#   
plot.new()
plot.window(xlim = c(0, 1), ylim = range(levels), xaxs = "i", yaxs = "i")

rect(0, levels[-length(levels)], 1, levels[-1L],col=col,border=col) 
if (missing(key.axes)) {if (axes){axis(4)}}
       else key.axes
   box()
   if (!missing(key.title)) 
     key.title
   mar <- mar.orig
   mar[4L] <- 1
   par(mar = mar)
   print(xlim)
   # points
   plot(x,y,type = "n",xaxt='n',yaxt='n',xlab="",ylab="",xlim=xlim,ylim=ylim,bty="n", log=log)
   points(x,y,col = colz,xaxt='n',yaxt='n',xlab="",ylab="",bty="n",...)

   ## options to make mapping more customizable

        if (missing(plot.axes)) {
          if (axes) {
            title(main = "", xlab = "", ylab = "")
            Axis(x, side = 1)
            Axis(y, side = 2)
          }
        }
        else plot.axes
        if (frame.plot) 
          box()
        if (missing(plot.title)) 
          title(...)
        else plot.title
        invisible()
 }

systemic <- function() {
    source("~/Projects/Systemic2/R/systemic.r", chdir=TRUE)
}

capply <- function(...) {
    l <- sapply(...)
    return(Filter(Negate(is.null), x))
}

cat(getwd(), '\n')
