---
title: "Assignment 3: Incarceration"
permalink: /
layout: default
---

<h1> Assignment 3: Incarceration </h1>

<h2> Introduction </h2>

Vera Institute of Justice is an organization built upon advocates, researchers, and activists who wish to rectify the discriminatory criminal legal system. They hosts a website which garners and disseminates information concerning over-criminalization and incarceration across the United States of America. The *Incarceration Trends Dataset* provided by Vera was utilized in this report for thorough analysis and examination. This specific dataset extracts data from county and jurisdiction level jails from 1970 to 2018. It also incorporates prison data from 1983 to 2016. Jails and prison systems tend to be the locations with the greatest amount of racism and unbalanced power dynamics incorporated into its system. This report aims to analyze specific trends that may allude to or help us understand the impacts of the U.S. criminal and justice system on specific demographics. Through this data, we may be able to identify which groups are being targeted by an inequitable justice system.

The variables I have chosen to analyze mainly focus on the relationship and disparity between the population of blacks and whites entering into U.S. jails. I was interested in identifying and examining the locations where this disparity may be greater or where there may be a high concentration of one demographic or another. I also looked at years to determine if there were any time periods in which there may have been a drastic increase or decrease between the number or rate at which black individuals were entering into the criminal legal system. Essentially, I have chosen to focus on year, counties, and population of blacks and whites as my variables to process. Measures of incarceration I focused on for my report within this dataset were populations of race, specifically between black and white individuals.

<h3> 5 Values of Interest </h3>
Five values I was interested in seeking enlightenment or knowledge of was the ratio value between the population of blacks in jail in 2013 to the number of whites in jail in 2013. Another value of interest was which county had the highest population of blacks within their jail and which county had the lowest. I was also intrigued in discovering what the difference is between the population of blacks in jail in 2005 to 2013? Was there an increase or decrease? The trend of the population of whites and blacks within jail systems over the years is also an important area of interest worth delving into. The fifth value of interest is the trend of black populations within Los Angeles County jails over the years. How does this compare to the population of whites? Is there an increase or decrease from either of the two throughout the years?
</p>


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
**Trends Over Time Chart**

```{r}
source("chart1.R")
```
**Variable Comparison Chart**

```{r}
source("chart2.R")
```

**Map**

```{r}
source("map.R")
```
