o.default = {
  calculationFigures: {
      kmsPerMile: 1.60934,
      kgPerMile: .392,
      kgPerPassenger: 320,
      kgPerPassengerWS: 470,
      metersSquaredPerCourt: 261,
      litersPerShower: 65,
      annualHomeHeatingEmmision: 2300,
      weeksInYear: 52,
      daysInYear: 365
  },
  foodGroups: {
      food_group_1: "Protein-rich foods",
      food_group_2: "Milks",
      food_group_3: "Fruit & Veg",
      food_group_4: "Starches",
      food_group_5: "Sugar",
      food_group_6: "Drinks"
  },
  frequencyInformation: {
      dropdown_option_1: {
          text: "1-2 times a week",
          value: 1.5
      },
      dropdown_option_2: {
          text: "3-5 times a week",
          value: 4
      },
      dropdown_option_3: {
          text: "Once a day",
          value: 7
      },
      dropdown_option_4: {
          text: "Twice a day or more",
          value: 14
      },
      dropdown_option_5: {
          text: "Never",
          value: 0
      }
  },
  foodIDsForDropdownAlternativeText: ["1", "2", "9", "11", "13", "23", "29", "32", "33"],
  currentImpactValue: null
};

"use strict";
(function(t) {
  var c = o.default.calculationFigures,
    f = c.kmsPerMile,
    s = c.kgPerMile,
    l = c.kgPerPassenger,
    h = c.kgPerPassengerWS,
    d = c.metersSquaredPerCourt,
    p = c.litersPerShower,
    v = c.annualHomeHeatingEmmision,
    y = c.weeksInYear,
    g = c.daysInYear,
    m = o.default.foodGroups,
    b = (function() {
      function n() {
        (0, r.default)(this, n);
      }
      return (
        (n.prototype.readInData = function(t) {
          var n = this;
          (this.data = {}),
            (this.calcFigs = o.default.calculationFigures),
            window
              .fetch(
                "https://www.bbc.co.uk/indepthtoolkit/data-sets/green_diet_data/json-with-props"
              )
              .then(function(t) {
                return t.json();
              })
              .then(function(e) {
                (n.data = e),
                  (n.frequencyKeys = Object.values(
                    o.default.frequencyInformation
                  )),
                  t();
              });
        }),
        (n.prototype.getFoodsForDropdown = function() {
          return Object.keys(this.data).map(function(n) {
            return o.default.foodIDsForDropdownAlternativeText.includes(n)
              ? t("food_" + n + "_dropdown_option")
              : t("food_" + n);
          });
        }),
        (n.prototype.getFoodIdFromDropdownOption = function(n) {
          return this.getFoodId(n)
            ? this.getFoodId(n)
            : o.default.foodIDsForDropdownAlternativeText.filter(function(e) {
                return t("food_" + e + "_dropdown_option") === n;
              })[0];
        }),
        (n.prototype.getDropdownTextFromFood = function(n) {
          var e = this.getFoodId(n);
          return o.default.foodIDsForDropdownAlternativeText.includes(e)
            ? t("food_" + e + "_dropdown_option")
            : t("food_" + e);
        }),
        (n.prototype.getFrequencyOptions = function() {
          return this.frequencyKeys.map(function(t) {
            return t.text;
          });
        }),
        (n.prototype.getFrequencyValue = function(t, n) {
          return "Never" === t
            ? "english" === i.default.getConfig().language
              ? this.getAverageServingsPerWeek(n)
              : this.getAverageServingsPerWeekWS(n)
            : this.frequencyKeys.filter(function(n) {
                return n.text === t;
              })[0].value;
        }),
        (n.prototype.getServingSize = function(n) {
          return t("food_" + this.getFoodId(n) + "_serving_size");
        }),
        (n.prototype.getFoodId = function(n) {
          return Object.keys(this.data).filter(function(e) {
            return t("food_" + e) === n;
          })[0];
        }),
        (n.prototype.getGhgPerServing = function(t) {
          return this.data[this.getFoodId(t)].ghg;
        }),
        (n.prototype.getLandUsePerServing = function(t) {
          return this.data[this.getFoodId(t)].land_use;
        }),
        (n.prototype.getWaterUsePerServing = function(t) {
          return this.data[this.getFoodId(t)].water_use;
        }),
        (n.prototype.getSentenceNamesForFood = function(t) {
          return this.data[this.getFoodId(t)].sentences.split(", ");
        }),
        (n.prototype.getAverageServingsPerWeek = function(t) {
          return this.data[this.getFoodId(t)].avg_servings_uk;
        }),
        (n.prototype.getAverageServingsPerWeekWS = function(t) {
          return this.data[this.getFoodId(t)].avg_servings_global;
        }),
        (n.prototype.getLandUse = function(t, n) {
          return (
            this.getLandUsePerServing(t) * this.getFrequencyValue(n, t) * y
          );
        }),
        (n.prototype.getNumberOfCourts = function(t, n) {
          return this.getLandUse(t, n) / d;
        }),
        (n.prototype.getWaterUse = function(t, n) {
          return (
            this.getWaterUsePerServing(t) * this.getFrequencyValue(n, t) * y
          );
        }),
        (n.prototype.getNumberOfShowers = function(t, n) {
          return this.getWaterUse(t, n) / p;
        }),
        (n.prototype.getGhgPerYear = function(t, n) {
          return this.getGhgPerServing(t) * this.getFrequencyValue(n, t) * y;
        }),
        (n.prototype.getNumberOfMiles = function(t, n) {
          return this.getGhgPerYear(t, n) / s;
        }),
        (n.prototype.getNumberOfKm = function(t) {
          return t * f;
        }),
        (n.prototype.getNumberOfDays = function(t, n) {
          return this.getGhgPerYear(t, n) / (v / g);
        }),
        (n.prototype.getNumberOfFlights = function(t, n) {
          return this.getGhgPerYear(t, n) / l;
        }),
        (n.prototype.getNumberOfWSFlights = function(t, n) {
          return this.getGhgPerYear(t, n) / h;
        }),
        (n.prototype.getFoodGroupVocabKey = function(t) {
          var n = this;
          return Object.keys(m).filter(function(e) {
            return n.data[n.getFoodId(t)].food_group === m[e];
          })[0];
        }),
        (n.prototype.getFoodGroup = function(n) {
          return t(n);
        }),
        (n.prototype.roundNumbersIfAppropriate = function(t) {
          var n =
            !(arguments.length > 1 && void 0 !== arguments[1]) || arguments[1];
          return t < 2
            ? t.toFixed(1).replace(/[.,]0$/, "")
            : n
            ? Math.floor(t)
            : Math.round(t);
        }),
        (n.prototype.formatNumberForOutput = function(t) {
          return u.default.format("" + i.default.getConfig().language, t);
        }),
        (n.prototype.getUnselectedFoodGroups = function(n) {
          var e = this,
            r = Object.values(m).filter(function(t) {
              return t !== e.getFoodType(n);
            });
          return Object.keys(m)
            .map(function(n) {
              return r.includes("" + m[n]) ? t("" + n) : null;
            })
            .filter(function(t) {
              return null !== t;
            });
        }),
        (n.prototype.getUnselectedFoodGroupKeys = function(t) {
          var n = this.getFoodGroupVocabKey(t);
          return Object.keys(m).filter(function(t) {
            return t !== n;
          });
        }),
        (n.prototype.getListofFoodsByGroup = function(n) {
          var e = this,
            r = Object.keys(m).filter(function(t) {
              return t === n;
            })[0];
          return Object.keys(this.data)
            .filter(function(t) {
              return e.data[t].food_group === m[r];
            })
            .map(function(n) {
              return t("food_" + n);
            });
        }),
        (n.prototype.getRandomFoodFromEachUnselectedGroup = function(n) {
          var e = this;
          return this.getUnselectedFoodGroupKeys(n).map(function(n) {
            var r = e.getListofFoodsByGroup(n);
            return t(
              "food_" + e.getFoodId(r[Math.floor(Math.random() * r.length)])
            );
          });
        }),
        n
      );
    })();
  n.default = b;
}.call(this, e(49)));
