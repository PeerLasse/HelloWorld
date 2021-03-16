library(readr)
library(tseries)
data=read_csv2("Veränderung Pendlermobilität und sonstige Mobilität Jan-Dez 2020 ggü. 2019.csv")

sonst=seq(3,26,2)
pend=seq(4,26,2)


SH=data[data[,1]<2000,]

SH_pend=SH[,pend]
SH_sonst=SH[,sonst] 

SH_ts=ts(colMeans(SH_pend),start=c(2020,1),frequency = 12)

ts.plot(SH_ts,gpars=list(col="blue",lwd=2,lty=1,xlab="time",ylab="Änderung Pendlermobilität in % (ggü. 2019)"))
