library("ggplot2")

outlier_plot <- function(y) {

    x <- 1:length(y)
    
    model <- lm(y ~ x)
    
    r <- ((model$residuals - mean(model$residuals)) / sd(model$residuals))
    
    par(mfrow = c(1,2))
    
    plot(r, pch = 19 ,ylab = "Standardized Residuals", yaxt = "n")
    axis(side=2, at=c(-5, -4,-3,-2,-1,0,1,2,3,4,5))
    abline(a=3,b=0, col="red")
    abline(a=-3,b=0, col="red")
    


    hist(r, prob=TRUE,  main="")
    rug(r)
    lines(density(r))
    
}

