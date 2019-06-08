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

Thus, I decided to only dig deeper into ne of the metrics - the one about life expectancy at birth. Just by looking at the above chart, we can already tell which are the variables that correlate the most with this metric. It seems like alcohol consumption is not that important. In fact, it seems like that the more alcohol people consume, the longer they live. As we all know, correlation doesn't equal causation, and thus we should not draw the conclusion that we should drink more to live longer. 

## Interpretation

So than what could be the reason for this positive relationship?

![alt text](https://github.com/molnardan95/Mastering_DS_Assignment/blob/master/Charts/variable_importance.png)

Looking at the above chart, we see that there are three variables which have very high positive correlation with LE. All three are in connection with the general living conditions of a country. The better people live, the more cellphones tehy will buy. The better the living conditions, the higher the GDP and the percentage of people who can actually read. These relationships make much more sense. 

On the negative side, infant mortality has the biggest correlations with LE, which once again makes a lot of sense. Children who die at a very early age can lower the statistical average of LE by a big margin. We also see birthrate and deathrate as big contributors to the LE numbers.

So what about alcohol?

![alt text](https://github.com/molnardan95/Mastering_DS_Assignment/blob/master/Charts/life_exp_vs_alcohol.png)

It seems like the more alcohol people consume, the higher their life expectancy is. But we saw previously that there is a much higher correlation with living conditions and gdp. 

![alt text](https://github.com/molnardan95/Mastering_DS_Assignment/blob/master/Charts/gdp_vs_alcohol.png)

This above chart might give us the best explanation about this suspicious relationship between alcohol and LE. We can see how the higher the GDP is in a country, the more alcohol they consume. And thus even though alcohol might have a damiging effect on ones life, because of the bigger effect of higher GDP, this outweights the negatives. 

In fact, it is very possible and would be logical to say that the consumption of a lot of alcohol would drop LE by some margin even though we can't infer that from the above vharts. Why? Because there are so many favtors that decide how long someone lives, or what the LE is in a country that it is actually very hard to corner out just one variable, and see its affect in the whole scheme of things.

## Summary

Based on my analysis it seems like alcohol consumption doesn't have such a high affect on life expectancy as we might have anticipated. By just looking at correlation, it actually seems to positively correlate with LE, even though we know how damaging it can be. 

By looking deeper into the data, we can see that this is due to the fact that richer countries drink more usually, and because they have higher living conditions their LE bacomes higher on average. 

We shouldn't make the mistake of saying that alcohol consumption has a positive affect on life expectancy, but we can draw the conclusion that there are more important things in deciding how long we live.

## Afterword

During my analysis, I followed the guidance layed down in the assignment, and thus didn't go deeper into uncovering more interesting chracteristics of the dataset. With more advanced methods, it would probably be possible to uncover how alcohol consumption could actually negatively affect peoples lives and how it actually has a negative effect on life expectany. For now though with this basic analysis, we can see how there are more important factors in the average life expectancy of a country.


