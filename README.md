Global Socio-Economic Analysis Project Readme
Overview:
This comprehensive socio-economic analysis project aims to explore the relationships between economic indicators and happiness across nations. The analysis utilizes four primary datasets from reliable global databases, encompassing socio-economic, environmental, and happiness metrics for various countries.

Dataset Information:
Countries.csv: Socio-economic indicators, including GDP and GNI per capita.
Region.csv: Happiness scores and related metrics across different world regions.
WHR2023.csv: The World Happiness Report of 2023, offering extensive global happiness indices.
world-data-2023.csv: Wide-ranging socio-economic and environmental metrics for each country.
Datasets were sourced meticulously to ensure reliability and accuracy.

Tools & Libraries Used:
The statistical analysis was conducted using the R programming language, leveraging key libraries such as stats, ggplot2, and dplyr. R provided a robust environment for statistical computing, regression analysis, and advanced visualizations.

Algorithms:
The primary algorithm employed was linear regression, modeling the relationship between GDP per capita and happiness scores. Multiple regression was used for multivariate analysis, incorporating additional control variables.

Motivation/Background:
The project addresses the growing interest in understanding the determinants of national happiness and well-being. The core motivation is to explore the correlation between economic prosperity (GDP per capita) and happiness levels globally.

Hypothesis:
The central hypothesis posits a positive association between GDP per capita and happiness scores, suggesting that economic health is a significant predictor of well-being.

Findings:
The analysis confirmed the hypothesis, revealing a strong positive relationship between GDP per capita and happiness. Control variables like life expectancy and social support also showed significant associations, highlighting the complexity of happiness.

Pipeline/Process:
The analytical process involved data loading, inspection, merging, cleaning, and pre-processing. Exploratory Data Analysis (EDA) provided visual insights, followed by statistical testing and extensive multivariate analysis to control for confounding factors.

Visualizations:
Visual aids include scatter plots with regression lines, bar plots for regional comparisons, and tables summarizing regression results.

Personal Opinion:
Results suggest that economic factors are significant but not exhaustive in explaining national happiness. Policy implications advocate for a holistic development approach, considering economic, social, and personal well-being.

Reflections/Future:
Future research should explore additional predictors, including cultural and environmental factors. A larger dataset spanning more countries and a longer timeframe could enhance the analysis, tracking changes over time.
