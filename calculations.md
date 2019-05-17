# Calculations

Here you can find all the figures calculations used to construct data used throughout the app.

## Sentences

### GHG Sentence 1

![](assets/GHG.sentence.1.svg) 

That's the equivalent of driving a regular petrol car [ **getNumberOfMiles** ] miles ([ **getNumberOfKm** ]km).

### GHG Sentence 2

![](assets/GHG.sentence.2.svg)

the same as heating the average UK home for [ **getNumberOfDays** ] days.

### GHG Sentence 3

![](assets/GHG.sentence.3.svg)

like taking [ **getNumberOfFlights** ] return flight from London to Malaga.

### Land Sentence

![](assets/Land.sentence.svg)

[ **getLandUse** ]m² land, equal to the space of [ **getNumberOfCourts** ] tennis courts.

### Water Sentence

![](assets/Water.sentence.svg)

[ **getWaterUse** ] litres of water, equal to [ **getNumberOfShowers** ] showers lasting eight minutes.

## Constants

- kmsPerMile = `1.60934`
- kgPerMile = `0.392`
- kgPerPassenger = `320`
- kgPerPassengerGlobal = `470`
- metersSquaredPerCourt = `261`
- litersPerShower = `65`
- annualHomeHeatingEmmision = `2300`
- weeksInYear = `52`
- daysInYear = `365`

## Models

### Food Choice

    FoodChoice {
      String key
      String name
      String servingSize
      double ghg
      double landUse
      double waterUse
      String foodGroup
      String sentences
      double avgServingsGlobal
      double avgServingsUk
    }

### Food Choice

    Frequency {
      String name
      double value
    }

## Functions

### Base Variables

    f = kmsPerMile
    s = kgPerMile
    l = kgPerPassenger
    h = kgPerPassengerGlobal
    d = metersSquaredPerCourt
    p = litersPerShower
    v = annualHomeHeatingEmmision
    g = daysInYear
    y = weeksInYear

    t = foodChoice
    n = frequencyChoice

### Get Frequency Value

    t = foodChoice
    n = frequencyChoice

    getFrequencyValue(t, n) {
      if (n === "Never")
        if(language === "English")
          getAverageServingsPerWeek(t)
        else
          this.getAverageServingsPerWeekGlobal(t)
      else 
        t.value
    }

### Average Servings Per Week

    t = foodChoice
    n = frequencyChoice

    getAverageServingsPerWeek(t) {
      return t.avg_servings_uk;
    }

### Average Servings Per Week (Global)

    t = foodChoice
    n = frequencyChoice

    getAverageServingsPerWeekGlobal(t) {
      return t.avg_servings_global;
    }

### Number Of Miles

    t = foodChoice
    n = frequencyChoice
    s = kgPerMile

    getNumberOfMiles(t, n) {
      return getGhgPerYear(t, n) / s
    }

### Number Of Kilometers

    t = getNumberOfMiles(
        foodChoice,
        frequencyChoice
      )
    f = kmsPerMile

    getNumberOfKm(t) {
      return t * f
    }

### Home Heating Days

    t = foodChoice
    n = frequencyChoice
    v = annualHomeHeatingEmmision
    g = daysInYear

    getNumberOfDays(t, n) {
      return getGhgPerYear(t, n) / (v / g)
    }

### Number Of Flights

    t = foodChoice
    n = frequencyChoice
    l = kgPerPassenger

    getNumberOfFlights(t, n) {
      return getGhgPerYear(t, n) / l
    }

### Number Of Flights (Global)

    t = foodChoice
    n = frequencyChoice
    h = kgPerPassengerGlobal

    getNumberOfGlobalFlights(t, n) {
      return getGhgPerYear(t, n) / h
    }

### Land Usage Per Serving

    t = foodChoice

    getLandUsePerServing(t) {
      return t.land_use
    }

### Land Usage

    t = foodChoice
    n = frequencyChoice
    y = weeksInYear

    getLandUse(t, n) {
      return (
        getLandUsePerServing(t) * getFrequencyValue(n, t) * y
      )
    }

## Number of Tennis Courts

    t = foodChoice
    n = frequencyChoice
    d = metersSquaredPerCourt

    getNumberOfCourts(t, n) {
      return getLandUse(t, n) / d;
    }

## Water Usage (Per Serving)

    t = foodChoice

    getWaterUsePerServing(t) {
      return t.water_use;
    }

## Annual Water Usage (Litres) 

    t = foodChoice
    n = frequencyChoice
    y = weeksInYear

    getWaterUse(t, n) {
      return (
        getWaterUsePerServing(t) * getFrequencyValue(n, t) * y
      )
    }

## Annual Number of Showers 

    t = foodChoice
    n = frequencyChoice
    p = litersPerShower

    getNumberOfShowers(t, n) {
      return getWaterUse(t, n) / p;
    }