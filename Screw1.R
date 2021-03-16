library(readr)
library(tseries)
data=read_csv2("Veränderung Pendlermobilität und sonstige Mobilität Jan-Dez 2020 ggü. 2019.csv")

sonst=seq(3,26,2)
pend=seq(4,26,2)


SH=data[data[,1]<2000,]
N=data[data[,1]>2000 & data[,1]<4000,]

SH_pend=SH[,pend]
SH_sonst=SH[,sonst] 

N_pend=N[,pend]
N_sonst=N[,sonst] 

SH_ts=ts(colMeans(SH_pend),start=c(2020,1),frequency = 12)
N_ts=ts(colMeans(N_pend),start=c(2020,1),frequency = 12)

ts.plot(SH_ts,N_ts,gpars=list(col=c(1,2),lwd=2,lty=c(1,2),xlab="time",ylab="Änderung Pendlermobilität in %",main="Veränderung Pendlermobilität in % ggü 2019"))
legend("bottomright",legend=c("Schleswig-Holstein","Niedersachsen"),col = c(1,2),lty=c(1,2),lwd=2)

