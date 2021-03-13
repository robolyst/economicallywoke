---
chapter: 2
title: "Your first strategy"
subtitle: "start with something simple"

artwork: "img/simple.png"
date: "2020-12-22"
type: article
katex: true
bokeh: true
draft: true
markup: "mmark"
---

OK

* We want a strategy that we can set and forget
* Something that will provide for us much later in the future
* We can invest into a market index
* Understanding the investment
    * Returns over X periods
    * Drawdowns
    * unit returns
    * Income/Dividends
    * What happens during tough times?
* How often to invest?
* How much to invest each time?
* Summary of the strategy and what we've learned


# Story outline

* Set a goal: retirement
* Get specific: what are the details? How much income do I need? How much capital do I need?
* Market analysis: What do we think the market will look like when we want to retire?
* Strategy: How much to invest every year?


# Old stuff



## Inflation

The Reserve Bank of Australia aims to hold an inflation rate of 2-3% per annum 1. In this report, we will assume an annual inflation rate of 2.5%. 

ref: https://www.rba.gov.au/inflation/inflation-target.html


## Important dates

The most important date here is the date I retire. This is when I need to have funds ready as I will no longer be able to add further funds


## Australian Stock Market

I will be investing in the Australian economy. I will use the Australian All Ordinaries (AORD) as the proxy to the Australian economy. Stooq.com provides prices for the AORD. They have monthly quotes from 1875 and daily quotes from 1980. 1980 is when the index officially started.

To plan investments in the Australian economy for my retirement I need to estimate the price. I can extrapolate with a linear regression on the log10 prices. However, I observe there is a increase in the log10 prices. Previous financial plans found that a polynomial model of order 2 fits best.

A graph of the AORD prices and polynomial fit is:

![Example image](/assets/first_strategy/market_prediction.png)

The following table gives a basic summary of the Australian Economic outlook over my working life:

![Example image](/assets/first_strategy/table.png)

## Life Time Target

How much annual income do I want?

![Example image](/assets/first_strategy/desired_income.png)

How much money will I need to generate this income?

![Example image](/assets/first_strategy/required_capital.png)

I'm targeting to have $9,086,443.44 as capital for retirement


## Life long plan

We need to figure out how much money to add to the portfolio each year. The variables are:

$$
\begin{aligned}
\phi \quad & \text{Annual inflation rate} = 2.5\% \\
T    \quad & \text{Total number of years} = 43 \\
m    \quad & \text{Money to invest every year (discounted)} \\
p_y  \quad & \text{Price at the end of year } y \\
C    \quad & \text{Current amount of capital invested} = \$18,722 \\
A    \quad & \text{The target amount of capital invested after } T \text{ years } = \$9,432,960 \\
\end{aligned}
$$

The number of units we already have is:

$$
\frac{C}{p_{\text{now}}}
$$

The amount of money we want to invest in year $y$ is:

$$
m(1 + \phi)^y
$$

Which gives us the following number of units in the underlying asset:

$$
m \frac{(1 + \phi)^y}{p_y}
$$

The total number of units I'll have after $$T$$ years is:

$$
\frac{C}{p_{\text{now}}} +m \sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y}
$$

The value of these units will be:

$$
\left( \frac{C}{p_{\text{now}}} +m \sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y} \right) p_{\text{now} + T} = A
$$

Soling for $$m$$ gives:

$$
\begin{aligned}
\left( \frac{C}{p_{\text{now}}} +m \sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y} \right) p_{\text{now} + T} &= A \\
\frac{C}{p_{\text{now}}} +m \sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y} &= \frac{A}{p_{\text{now} + T}} \\
m \sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y} &= \frac{A}{p_{\text{now} + T}} - \frac{C}{p_{\text{now}}} \\
m &= \frac{\frac{A}{p_{\text{now} + T}} - \frac{C}{p_{\text{now}}}}{\sum_{y=\text{now}}^{\text{now}+T} \frac{(1 + \phi)^y}{p_y}} \\
\end{aligned}
$$

Needed units: 60.26238970738102

I currently have $57,495.00 invested

At the end of every year, I must invest a minimum of $21,731.93 to reach the target of $9,086,443.44

Every month, I must invest a minimum of 1,810.99