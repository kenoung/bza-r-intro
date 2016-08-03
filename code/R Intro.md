<style>
.midcenter {
    position: fixed;
    top: 50%;
    left: 50%;
}
.small-code pre code {
  font-size: 1em;
}
.smaller-code pre code {
  font-size: 0.9em;
}
.smallest-code pre code {
  font-size: 0.6em;
}
.smallestest-code pre code {
  font-size: 0.55em;
}
.big {
  font-size: 10em;
}
</style>


Welcome to BT1101.1
========================================================
author: 
date: 

Introductions Are In Order
========================================================
transition: fade
incremental: true

- Ken Oung
- Jun Weng
- Zhen Xuan
- Jin Wei
- Rhynade
- Selina
- Jian Sheng

Analytics, Schmanalytics
========================================================
transition: fade
incremental: true
- Descriptive Analytics
- Predictive Analytics
- Prescriptive Analytics

What To Expect
========================================================
transition: fade
incremental: true

- RStudio Basics
- Data Management
- Data Visualization
- Linear Regression

You're on your own for these
========================================================
transition: fade
incremental: true

- Statistical Analysis
- Logistic Regression
- Excel
- Unsupervised Learning

Getting Started
========================================================
transition: fade
title: false

<div class="midcenter" style="margin-left:-112.5px; margin-top:-112.5px;">
<img src="Rstudio.jpg" style="background-color:transparent; border:0px; box-shadow:none;"></img>
</div>

Importing Data
========================================================
incremental: true















































Sorting by Groups















dmef_small[, PRICE := EXT_PRICE/QUANTITY]
```

```r
object.price <- dmef_small[, .(PRODUCT_NO, PRODUCT_CATEGORY_ID, PRICE)]
```

```r
unique(object.price, by = c("PRODUCT_NO", "PRICE"))
```

```r





<img src="R Intro-figure/unnamed-chunk-29-1.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" style="display: block; margin: auto;" />



<img src="R Intro-figure/unnamed-chunk-30-1.png" title="plot of chunk unnamed-chunk-30" alt="plot of chunk unnamed-chunk-30" style="display: block; margin: auto;" />







<img src="R Intro-figure/unnamed-chunk-33-1.png" title="plot of chunk unnamed-chunk-33" alt="plot of chunk unnamed-chunk-33" style="display: block; margin: auto;" />






<img src="R Intro-figure/unnamed-chunk-36-1.png" title="plot of chunk unnamed-chunk-36" alt="plot of chunk unnamed-chunk-36" style="display: block; margin: auto;" />


















<img src="R Intro-figure/unnamed-chunk-45-1.png" title="plot of chunk unnamed-chunk-45" alt="plot of chunk unnamed-chunk-45" style="display: block; margin: auto;" />
<img src="R Intro-figure/unnamed-chunk-46-1.png" title="plot of chunk unnamed-chunk-46" alt="plot of chunk unnamed-chunk-46" style="display: block; margin: auto;" />

![plot of chunk unnamed-chunk-47](R Intro-figure/unnamed-chunk-47-1.png)

![plot of chunk unnamed-chunk-48](R Intro-figure/unnamed-chunk-48-1.png)



<img src="R Intro-figure/unnamed-chunk-49-1.png" title="plot of chunk unnamed-chunk-49" alt="plot of chunk unnamed-chunk-49" style="display: block; margin: auto;" />




<img src="R Intro-figure/unnamed-chunk-50-1.png" title="plot of chunk unnamed-chunk-50" alt="plot of chunk unnamed-chunk-50" style="display: block; margin: auto;" />




<img src="R Intro-figure/unnamed-chunk-51-1.png" title="plot of chunk unnamed-chunk-51" alt="plot of chunk unnamed-chunk-51" style="display: block; margin: auto;" />













<img src="R Intro-figure/unnamed-chunk-60-1.png" title="plot of chunk unnamed-chunk-60" alt="plot of chunk unnamed-chunk-60" style="display: block; margin: auto;" />




```
Error in setwd("~/R Intro/bza-r-intro/code") : 
  cannot change working directory
<img src="R Intro-figure/unnamed-chunk-63-1.png" title="plot of chunk unnamed-chunk-63" alt="plot of chunk unnamed-chunk-63" style="display: block; margin: auto;" />
class:small-code
<img src="R Intro-figure/unnamed-chunk-66-1.png" title="plot of chunk unnamed-chunk-66" alt="plot of chunk unnamed-chunk-66" style="display: block; margin: auto;" />
<img src="R Intro-figure/unnamed-chunk-73-1.png" title="plot of chunk unnamed-chunk-73" alt="plot of chunk unnamed-chunk-73" style="display: block; margin: auto;" />
<img src="R Intro-figure/unnamed-chunk-74-1.png" title="plot of chunk unnamed-chunk-74" alt="plot of chunk unnamed-chunk-74" style="display: block; margin: auto;" />

incremental:true
- Linearity
- Normality
- Homoscedasticity
- Independence of Errors (time series)


Drawing Lines
========================================================
class:smaller-code
```

<img src="R Intro-figure/unnamed-chunk-79-1.png" title="plot of chunk unnamed-chunk-79" alt="plot of chunk unnamed-chunk-79" style="display: block; margin: auto;" />



Multicollinearity
========================================================
incremental:true

```r
library(car)
durbinWatsonTest(fit_final)
```

```
 lag Autocorrelation D-W Statistic p-value
   1      0.06134832      1.796144   0.438
 Alternative hypothesis: rho != 0
```

```r
vif(fit_final)
```

```
      wt       am  log(hp) 
3.806564 2.108117 2.250186 
```






