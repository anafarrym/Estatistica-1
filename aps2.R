# APS2

# ITEM A
# gr�fico de dispers�opara todo o per�odo analisado
plot(chile$Inflation~chile$Unemployment, pch=16,
     xlab="Desemprego",
     ylab="Infla��o",
     main="Dispers�o de todo o per�odo")
abline(lm(chile$Inflation~chile$Unemployment),col="red",lwd=2)

plot(chile$Inflation,chile$Unemployment,type="l",
     xlim = c(0,380))
plot(chile$Inflation  ,
               type = "l" , lwd=2)
plot(chile$Unemployment, type = "l")
plot(chile$Unemployment,chile$Inflation,type="l")
xyplot(Unemployment ~ Year, data = chile[chile$Unemployment == "CHE",] ,
               type = "l" , lwd=2)
doubleYScale(obj1, obj2, add.ylab2 = TRUE,
             add.axis = TRUE, col = "black", )


cov1=cov(chile$Unemployment,chile$Inflation,use="pairwise.complete.obs") 
cor1=cor(chile$Unemployment,chile$Inflation,use="pairwise.complete.obs")

#medidas resumo A
TabMR=vector()
nome_fun=c("mean", "median", "sd", "min", "max")
for (fun in nome_fun)
{
  MR=mapply(chile[4:5], FUN=fun,na.rm = TRUE)
  TabMR=cbind(TabMR,MR)
}
colnames(TabMR)=c("M�dia", "Mediana", "DP", "M�nimo", "M�ximo")
View(TabMR)


# ITEM C
# gr�fico de dispers�o  
par(mfrow=c(1,2))
plot(chile$Inflation[chile$Year>1991]~chile$Unemployment
     [chile$Year>1991],pch=16,
     xlab="Desemprego",
     ylab="Infla��o",
     main="Dispers�o depois de 1991")
abline(lm(chile$Inflation[chile$Year>1991]~chile$Unemployment
          [chile$Year>1991]),col="red",lwd=2)

plot(chile$Inflation[chile$Year<=1991]~chile$Unemployment
     [chile$Year<=1991], pch=16,
     xlab="Desemprego",
     ylab="Infla��o",
     main="Dispers�o antes de 1991")
abline(lm(chile$Inflation[chile$Year<=1991]~chile$Unemployment
          [chile$Year<=1991]),col="red",lwd=2)

cov2=cov(chile$Unemployment[chile$Year>1991],
         chile$Inflation[chile$Year>1991])
cov3=cov(chile$Unemployment[chile$Year<=1991],
         chile$Inflation[chile$Year<=1991],use="pairwise.complete.obs")  

cor2=cor(chile$Unemployment[chile$Year>1991],
         chile$Inflation[chile$Year>1991])
cor3=cor(chile$Unemployment[chile$Year<=1991],
         chile$Inflation[chile$Year<=1991],use="pairwise.complete.obs")  

#infla��o
infantes=summary(chile$Inflation[chile$Year<=1991],
                 use="pairwise.complete.obs") #antes de 1991
print(infantes)
infdep=summary(chile$Inflation[chile$Year>1991],
               use="pairwise.complete.obs")  #depois de 1991
print(infdep)

#desemprego
desantes=summary(chile$Unemployment[chile$Year<=1991],
                 use="pairwise.complete.obs") #antes de 1991
print(desantes)
desdep=summary(chile$Unemployment[chile$Year>1991],
               use="pairwise.complete.obs") #depois de 1991
print(desdep)

#tabelas
tabantes=rbind(infantes,desantes) 
colnames(tabantes)=c("Minimo",'1st Qu.','Mediana',
                    'M�dia',"3st Qu","M�ximo","vazios")
View(tabantes) #tabelas antes de 1991

tabdep=rbind(infdep,desdep)
colnames(tabdep)=c("Minimo",'1st Qu.','Mediana',
                     'M�dia',"3st Qu","M�ximo")
View(tabdep)  #tabelas depois de 1991

#histogramas
par(mfrow=c(1,2))
hist(chile$Inflation, probability = TRUE,
     main= "Histograma da Infla��o",
     ylab= "Densidade",
     xlab= "Infla��o",
     col="darkblue",
     ylim = c(0,0.01))
lines(density(chile$Inflation,na.rm = TRUE),lwd=2,col="green")

hist(chile$Unemployment, probability = TRUE,
     main= "Histograma do Desemprego",
     ylab= "Densidade",
     xlab= "Desemprego",
     col="darkred")
lines(density(chile$Unemployment,na.rm = TRUE),lwd=2,col="green")

#quantiles de tudo
quantile(chile$Inflation,0.25,na.rm = TRUE)
quantile(chile$Inflation,0.5,na.rm = TRUE)
quantile(chile$Inflation,0.75,na.rm = TRUE)
quantile(chile$Inflation,1,na.rm = TRUE)

quantile(chile$Unemployment,0.25,na.rm = TRUE)
quantile(chile$Unemployment,0.5,na.rm = TRUE)
quantile(chile$Unemployment,0.75,na.rm = TRUE)
quantile(chile$Unemployment,1,na.rm = TRUE)

#quantiles antes de 1991
quantile(chile$Inflation[chile$Year<=1991],0.25,na.rm = TRUE)
quantile(chile$Inflation[chile$Year<=1991],0.5,na.rm = TRUE)
quantile(chile$Inflation[chile$Year<=1991],0.75,na.rm = TRUE)
quantile(chile$Inflation[chile$Year<=1991],1,na.rm = TRUE)

quantile(chile$Unemployment[chile$Year<=1991],0.25,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year<=1991],0.5,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year<=1991],0.75,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year<=1991],1,na.rm = TRUE)

#quantile depois de 1991
quantile(chile$Unemployment[chile$Year>1991],0.25,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],0.5,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],0.75,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],1,na.rm = TRUE)

quantile(chile$Unemployment[chile$Year>1991],0.25,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],0.5,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],0.75,na.rm = TRUE)
quantile(chile$Unemployment[chile$Year>1991],1,na.rm = TRUE)

#tabela de correla��o e covari�ncia
TabC=rbind(cov1,cor1,cov2,cor2,cov3,cor3)
rownames(TabC)=c("Covari�ncia", "Correla��o",
                 "Covari�ncia 1960-1991","Correla��o 1960-1991","Covari�ncia 1991-2019","Correla��o 1991-2019")
colnames(TabC)=c("Atribui��es")
View(TabC)

#boxplot de tudo
par(mfrow=c(1,2))
boxplot(chile$Inflation,
        ylab="Densidade",
        xlab="Infla��o",
        main="Infla��o")
boxplot(chile$Unemployment,
        ylab="Densidade",
        xlab="Desemprego",
        main="Desemprego")

#boxplot depois de 1991
par(mfrow=c(1,2))
boxplot(chile$Inflation[chile$Year>1991],
        ylab="densidade",
        xlab="infla��o",
        main="infla��o depois de 1991")
boxplot(chile$Unemployment[chile$Year>1991],
        ylab="densidade",
        xlab="infla��o",
        main="desemprego depois de 1991")

#boxplot antes de 1991
par(mfrow=c(1,2))
boxplot(chile$Inflation[chile$Year<=1991],
        ylab="densidade",
        xlab="infla��o",
        main="desemprego antes 1991")
boxplot(chile$Unemployment[chile$Year<=1991],
        ylab="densidade",
        xlab="infla��o",
        main="desemprego antes 1991")
####################
a=quantile(chile$Inflation,0.25,na.rm = TRUE)
b=quantile(chile$Inflation,0.5,na.rm = TRUE)
c=quantile(chile$Inflation,0.75,na.rm = TRUE)
d=quantile(chile$Inflation,1,na.rm = TRUE)

e=quantile(chile$Unemployment,0.25,na.rm = TRUE)
f=quantile(chile$Unemployment,0.5,na.rm = TRUE)
g=quantile(chile$Unemployment,0.75,na.rm = TRUE)
h=quantile(chile$Unemployment,1,na.rm = TRUE)

tabqt= rbind(a,b,c,d)
rownames(tabqt)= c("25%","50%","75%","100%")
colnames(tabqt)= c("Infla��o")

tabtu= rbind(e,f,g,h)
rownames(tabtu)= c("25%","50%","75%","100%")
colnames(tabtu)= c("Desemprego")


#quantilesantes1991
aa=quantile(chile$Inflation[chile$Year<=1991],0.25,na.rm = TRUE)
ab=quantile(chile$Inflation[chile$Year<=1991],0.5,na.rm = TRUE)
ac=quantile(chile$Inflation[chile$Year<=1991],0.75,na.rm = TRUE)
ad=quantile(chile$Inflation[chile$Year<=1991],1,na.rm = TRUE)

ae=quantile(chile$Unemployment[chile$Year<=1991],0.25,na.rm = TRUE)
af=quantile(chile$Unemployment[chile$Year<=1991],0.5,na.rm = TRUE)
ag=quantile(chile$Unemployment[chile$Year<=1991],0.75,na.rm = TRUE)
ah=quantile(chile$Unemployment[chile$Year<=1991],1,na.rm = TRUE)

tabqta= rbind(aa,ab,ac,ad)
rownames(tabqta)= c("25%","50%","75%","100%")
colnames(tabqta)= c("Infla��o antes de 1991")

tabtub= rbind(ae,af,ag,ah)
rownames(tabtub)= c("25%","50%","75%","100%")
colnames(tabtub)= c("Desemprego antes de 1991")


#quantiledepois1991
ba=quantile(chile$Unemployment[chile$Year>1991],0.25,na.rm = TRUE)
bb=quantile(chile$Unemployment[chile$Year>1991],0.5,na.rm = TRUE)
bc=quantile(chile$Unemployment[chile$Year>1991],0.75,na.rm = TRUE)
bd=quantile(chile$Unemployment[chile$Year>1991],1,na.rm = TRUE)

be=quantile(chile$Unemployment[chile$Year>1991],0.25,na.rm = TRUE)
bf=quantile(chile$Unemployment[chile$Year>1991],0.5,na.rm = TRUE)
bg=quantile(chile$Unemployment[chile$Year>1991],0.75,na.rm = TRUE)
bh=quantile(chile$Unemployment[chile$Year>1991],1,na.rm = TRUE)


tabqtbb= rbind(ba,bb,bc,bd)
rownames(tabqtbb)= c("25%","50%","75%","100%")
colnames(tabqtbb)= c("Infla��o depois de 1991")


tabtubc= rbind(be,bf,bg,bh)
rownames(tabtubc)= c("25%","50%","75%","100%")
colnames(tabtubc)= c("Desemprego depois de 1991")

TAB_QUARTIS =cbind(tabqt,tabtu,tabqta,tabtub,tabqtbb,tabtubc)
View(TAB_QUARTIS)