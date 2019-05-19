# Climate Change Food Calculator

> CREDIT: 
> This is a port of the original web-based app designed by **Prina Shah** and developed by **Felix Stephenson** and **Becky Rush** into Flutter. - [Food Impact Calculator](https://www.bbc.com/news/science-environment-46459714)

Avoiding meat and dairy products is one of the biggest ways to reduce your environmental impact, according to recent scientific studies.

But what is the difference between beef and chicken? Does a bowl of rice produce more climate warming greenhouse gases than a plate of chips? Is wine more environmentally friendly than beer?

To find out the climate impact of what you eat and drink, choose from one of the 34 items in our calculator and pick how often you have it.

*All figures for each food in the calculator are global averages. See the [Calculations](calculations.md) section for more.*

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## How did we make the calculator?

### How is the environmental impact calculated?

University of Oxford researcher Joseph Poore, and Thomas Nemecek of the Agroecology and Environment Research Division in Zurich, Switzerland, looked at the environmental impact of 40 major food products that represent the vast majority of what is eaten globally.

They assessed the effect of these foods on climate-warming greenhouse gas emissions and the amount of land and fresh water used across all stages of their production, including processing, packaging, and transportation, but excluding the cooking process.

By analysing data from nearly 40,000 farms, 1,600 processors, packaging types and retailers, Poore and Nemecek were able to assess how different production practices and geographies have very different consequences on the planet.

### What about serving sizes?

The data in the study looked at the environmental impact for 1kg of each of the different food products.

For this story, these were converted to impact per serving sizes based on serving sizes from the British Dietetic Association (BDA) and healthy diet portion sizes from BUPA.

The figures for serving sizes based on the BDA and BUPA suggestions are often lower than portion sizes commonly found in restaurants and what people normally expect, so the figures returned by the calculator on the impact of individuals' consumption are likely to be higher in reality.

Protein-rich foods were calculated using the impact per 100g of protein from Poore and Nemecek's research and data on protein per serving from the BDA, to avoid differences between cooked and uncooked foods.

### What are greenhouse gases?

The figures for greenhouse gas emissions are in kilograms of carbon dioxide equivalents (CO2eq). This is a unit that converts the impact of different kinds of greenhouse gases, like methane and nitrous oxide, to the equivalent amount of carbon dioxide.

### How do you know what my diet is equal to in miles driven?

The annual impact from eating a specific food is calculated by multiplying the impact of one serving of that food by the times it is eaten in a year, based on the weekly estimates submitted by the user.

These are then compared with the emissions of other daily habits. The European Environment Agency estimates that driving a regular petrol car produces 392g of CO2eq/mile over its entire lifecycle, including emissions from the vehicle's production, fuel production and exhaust emissions per mile.

Heating the average UK home produces 2.34 tonnes of CO2eq annually, according to data from the Committee on Climate Change, and a passenger's carbon footprint for a return flight from London to Malaga is 320kg CO2eq, based on figures from the Carbon Neutral calculator.

The land used to produce the annual consumption of each food is compared with the size of a double tennis court, 261 metres squared.

The annual amount of water used is compared with a shower, based on figures suggesting the average shower lasts eight minutes and uses up 65 litres. Only "blue water", i.e. water taken out of rivers or the ground, is included in the data.

