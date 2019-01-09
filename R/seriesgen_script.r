source('./R/seriesgen.r')

x <- seq(from=0, to=24, by=5/60)
seriesgen(a=-.5, b=(1/12*pi), c=0, d=0.5, x=x) -> bfun

rep(x, 3) -> rx
bfun*100+100 -> bf100
bfun*500+500 -> bf500
bfun*1000+1000 -> bf1000

c(bf100,bf500, bf1000) -> cs
plot(cs~rx, xlab="x", ylab="y")

# mixture estimation with EM algorithm
library(mixtools)
normalmixEM(x = cs) -> nmix.null
normalmixEM(x = cs, k = 3) -> nmix3 # prior knowledge about 3 groups

mus <- c(mean(bf100), mean(bf500), mean(bf1000))
plot(nmix3$mu~mus, ylab="Estimated mean", xlab = "Mean")
abline(0,1)
