options(repos=structure(c(CRAN="http://cran.revolutionanalytics.com")))

require(stringr)
require(compiler)


invisible(enableJIT(3))
options(max.print = 100)


logseq <- function(from=1, to=10, length.out=10) {
    return(10^seq(log10(from), log10(to), length.out=length.out))
}

`%.%` <- function(str1, str2) {
    return(paste(str1, str2, sep=''))
}

printf <- function(...) {
    cat(sprintf(...))
}

usePackage <- function(p) {
    if (!is.element(p, installed.packages()[,1]))
        install.packages(p, dep = TRUE)
    require(p, character.only = TRUE)
}

cat(getwd(), '\n')
