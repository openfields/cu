source('./R/seriesgen.r')

x <- seq(from=0, to=24, by=5/60)
seriesgen(a=-.5, b=(1/12*pi), c=0, d=0.5, x=x) -> bfun

rep(x, 3) -> rx
bfun*100+100 -> bf100
bfun*500+500 -> bf500
bfun*1000+1000 -> bf1000

c(bf100,bf500, bf1000) -> cs
plot(cs~rx, xlab="x", ylab="y")

