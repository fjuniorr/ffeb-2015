par(ask=TRUE)
for(i in states) {
    bar <- 1:length(rcl[[i]])
    foo <- lm(rcl[[i]] ~ bar)
    z <- (foo$residuals - mean(foo$residuals)) / sd(foo$residuals)
    plot(z, main = i, pch = 19)
}