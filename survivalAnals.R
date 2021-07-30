library(cmprsk)
ALL <- data.frame(time =c(180, 360, 540, 720, 900),  censor=c(1, 2, 1, 2, 0), group=rep("A", 5) )
EVENT <- ALL
EVENT$censor <- ifelse(ALL$censor==1, 1, 0)
COMP <-  ALL
COMP$censor <- ifelse(ALL$censor==2, 1, 0)
result <- cuminc(EVENT$time, EVENT$censor, cencode=0)
#result2 <- timepoints(result, EVENT$time)
#result2$"est"

dev.new(width=5, height=4)
plot(result, col="red", curvlab="A", lty=2, ann=F)
par(new=T)
result <- cuminc(COMP$time, COMP$censor, cencode=0)
#result2 <- timepoints(result, COMP$time)
#result2$"est" 
plot(result, col="blue", curvlab="B", xlab="day", ylab="cdf")

title(main = "Survival Analytics")