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

cat(getwd(), '\n')
