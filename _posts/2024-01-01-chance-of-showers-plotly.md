---
layout: post
title: Chance of Showers Time Series
lead: Interactive time series plots in Plotly
---

<!-- markdownlint-disable-next-line -->
# Intro

Below is a sample of the pressure data collected by the Chance of Showers project in November 2023.
The plots are interactive, please explore!

## Raw analog to digital converter (ADC) values

The data acquisition (DAQ) system saves the raw pressure data
from the analog to digital converter (ADC) as an integer between 0 and 65472.
Note that occasionally a water hammer will increase the pressure above its steady state value,
marked by the orange 100% reference line,
with a subsequent decay on the order of 10 minutes.
When water is flowing at the pressure sensor,
the data is shown with an open purple marker.
Using water reduces the pressure slightly under normal conditions,
and abruptly ends overpressure events.

{% include chance_of_showers/mean_pressure_value_selected_data.html %}

## Normalized values

To clean the data before fitting any models,
we rescale the values to 0 and 1 between the steady state extrema.
Any values that are outside the normalization range are capped.

{% include chance_of_showers/mean_pressure_value_normalized_selected_data.html %}
