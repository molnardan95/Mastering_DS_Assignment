# Mastering the Process of Data Science Final Assignment

As part of the Mastering the Process of Data Science Class at the Central Europen University I got the task to analyze and uncover interesting characteristics of data regarding the relationship between alcohol consumption and life expectancy. This short article covers the steps in my analysis and the results I got from this project.

__Table of contents:__
* About the data
* Correlations
* Interpretation
* Summary
* Afterword

## About the data

The dataset provided to us contained three seperate tables about countries, their drinking habits and life expectancy. 

The drinks dataset contained information about a countries beer, wine and spirit consumption, out of which I calculated the total alcohol consumption per person per country which I will look at as the main importancz measure in trying to uncover whether alcohol consumption has a big effect on life expectancy in a country.

The life expectany table contained three different measures for all the countries regarding their life expectancy at birth, at 60 and healthy life expectancy. 

Lastly, the countries table contained variables about all the countries that could be important in the expected LE in these areas. Minor data cleaning was required in these tables.

## Correlations

After joining the datasets I looked at the three different measures, and tried to look at a basic correlation matrix for all of them. It turns out that the variables available for us have roughly the same correlation for all three of the different metrics.

![alt text](https://github.com/molnardan95/Mastering_DS_Assignment/blob/master/Charts/corrplot.png)


