> library(readxl)
> library(urca)
> IPCA <- read_excel("C:/EconometriaA/IPCA.xls", col_types = c("date","numeric"))
> Inflacao <- ts(IPCA$IPCA,start = 2008-01, frequency = 12)
> View(Inflacao)
> TesteDF <- summary(ur.df(Inflacao, type="none", lags=0))
> TesteDF

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression none 


Call:
  lm(formula = z.diff ~ z.lag.1 - 1)

Residuals:
  Min      1Q  Median      3Q     Max 
-0.7824 -0.1219  0.0827  0.2890  1.3882 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
z.lag.1 -0.20984    0.05443  -3.856 0.000184 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.3461 on 125 degrees of freedom
Multiple R-squared:  0.1063,	Adjusted R-squared:  0.09914 
F-statistic: 14.87 on 1 and 125 DF,  p-value: 0.0001837


Value of test-statistic is: -3.8556 

Critical values for test statistics: 
  1pct  5pct 10pct
tau1 -2.58 -1.95 -1.62

> acf(IPCA$IPCA, main="Inflacao Mensal")
> pacf(IPCA$IPCA, main="Inflacao Mensal")
> AR1 <- arima(Inflacao,order = c(1,0,0))
> AR1

Call:
  arima(x = Inflacao, order = c(1, 0, 0))

Coefficients:
  ar1  intercept
0.4648     0.4404
s.e.  0.0781     0.0513

sigma^2 estimated as 0.09696:  log likelihood = -32.15,  aic = 70.3
> AR2 <- arima(Inflacao, order=c(2,0,0))
> AR2

Call:
  arima(x = Inflacao, order = c(2, 0, 0))

Coefficients:
  ar1     ar2  intercept
0.4342  0.0636     0.4405
s.e.  0.0891  0.0899     0.0544

sigma^2 estimated as 0.09657:  log likelihood = -31.9,  aic = 71.8
> save.image("C:/EconometriaA/AULA -5/Comandos.RData")