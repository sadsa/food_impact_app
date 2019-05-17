# Calculations

A list of calculations and formula used to construct sentences throughout the app.

## Base Variables

- kmsPerMile = `1.60934`
- kgPerMile = `.392`
- kgPerPassenger = `320`
- kgPerPassengerWS = `470`
- metersSquaredPerCourt = `261`
- litersPerShower = `65`
- annualHomeHeatingEmmision = `2300`
- weeksInYear = `52`
- daysInYear = `365`

## Number Of Miles

    t = foodChoice,
    n = frequencyChoice
    s = c.kgPerMile

    getNumberOfMiles(t, n) {
      return this.getGhgPerYear(t, n) / s;
    }

## Number Of Kilometers

    t = getNumberOfMiles(
        foodChoice,
        frequencyChoice
      )
    f = c.kmsPerMile

    getNumberOfKm(t) {
      return t * f;
    }



That's the equivalent of driving a regular petrol car {{ getNumberOfMiles }} miles ({{ getNumberOfKm }}km).

the same as heating the average UK home for {{%s}} days.

like taking {{%s}} return flight from London to Malaga.

{{%s}}m² land, equal to the space of {{%s}} tennis courts.

{{%s}} litres of water, equal to {{%s}} showers lasting eight minutes.