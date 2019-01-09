source('./R/seriesgen.r')

# go from 0 to 108 hours in 5 min breaks
x <- seq(from=0, to=108, by=5/60)
seriesgen(a=-.5, b=(1/12*pi), c=0, d=0.5, x=x) -> bfun

rep(x, 3) -> rx
# create 3 series with different offsets
bfun*100+100 -> bf100
bfun*500+500 -> bf500
bfun*1000+1000 -> bf1000

# plot the 3 series together
c(bf100,bf500, bf1000) -> cs
plot(cs~rx, xlab="x", ylab="y")

# histogram
hist(cs, breaks=40)
abline(v = c(150, 750, 1500), col="red")

# mixture estimation with EM algorithm
library(mixtools)
normalmixEM(x = cs) -> nmix.null # no information
normalmixEM(x = cs, k = 3) -> nmix3 # prior knowledge about 3 groups

# look at estimated and actual means for groups
mus <- c(mean(bf100), mean(bf500), mean(bf1000))
plot(nmix3$mu~mus, ylab="Estimated mean", xlab = "Mean")
abline(0,1)
nmix3$sigma # sigmas make means look fairly reasonable

