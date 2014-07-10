require(stringr)
require(compiler)
invisible(enableJIT(3))
options(max.print = 100)
suppressPackageStartupMessages(library(stringr, logical.return=TRUE))

logseq <- function(from=0, to=1, by=((to-from)/(length.out - 1)), length.out=NULL) {
    return(10^seq(from, to, by, length.out))
}

`%.%` <- function(str1, str2) {
    return(paste(str1, str2, sep=''))
}

printf <- function(...) {
    cat(sprintf(...))
}

dpareto <- function(x, a=2.5, b=1) a*b^a/x^(a+1)
ppareto <- function(x, a=2.5, b=1) (x > b)*(1-(b/x)^a)
qpareto <- function(u, a=2.5, b=1) b/(1-u)^(1/a)
rpareto <- function(n, a=2.5, b=1) qpareto(runif(n),a,b)


cat(getwd(), '\n')
