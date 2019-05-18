o.default = {
  calculationFigures: {
    kmsPerMile: 1.60934,
    kgPerMile: 0.392,
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
  foodIDsForDropdownAlternativeText: [
    "1",
    "2",
    "9",
    "11",
    "13",
    "23",
    "29",
    "32",
    "33"
  ],
  currentImpactValue: null
};

("use strict");
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

("use strict");
(function(t) {
  n.__esModule = !0;
  var r = a(e(21)),
    i = a(e(10)),
    o = a(e(50)),
    u = a(e(25));
  function a(t) {
    return t && t.__esModule
      ? t
      : {
          default: t
        };
  }
  var c = (function() {
    function n() {
      var t = this;
      (0, r.default)(this, n),
        u.default.on("dropdown-update", function(n, e) {
          (t.foodChoice = e.getSelectedFood()),
            (t.frequencyChoice = e.getSelectedFrequency()),
            (t.datahandler = n),
            (t.sentenceNames = n.getSentenceNamesForFood(t.foodChoice)),
            (t.sentencesContainer = i.default.select(
              ".impact-sentences-container"
            )),
            (t.isLandWaterTitleSet = !1),
            (t.averageServingsPerWeek = n.getAverageServingsPerWeek(
              t.foodChoice
            )),
            t.update();
        });
    }
    return (
      (n.prototype.update = function() {
        var t = this;
        (this.sentencesContainer.innerHTML = ""),
          this.sentenceNames.forEach(function(n) {
            if (
              ((t.impactSentenceEl = document.createElement("div")),
              t.impactSentenceEl.classList.add("impact-sentence"),
              (t.sentenceImageContainer = document.createElement("div")),
              t.sentenceImageContainer.classList.add(
                "impact-sentence__image-container"
              ),
              "NA" === t.averageServingsPerWeek &&
                "Never" === t.frequencyChoice)
            )
              t.sentencesContainer.style.display = "none";
            else {
              t.sentencesContainer.style.display = "block";
              var e = t.constructSentence(n);
              null !== e &&
                (("Land.sentence" !== n && "Water.sentence" !== n) ||
                  t.isLandWaterTitleSet ||
                  t.setLandWaterTitle(),
                t.renderSentenceImage(n),
                t.impactSentenceEl.appendChild(t.sentenceImageContainer),
                t.renderSentenceElement(e, n.split(".")[0].toLowerCase()),
                t.sentencesContainer.appendChild(t.impactSentenceEl));
            }
          });
      }),
      (n.prototype.renderSentenceImage = function(t) {
        var n = document.createElement("img");
        (n.src =
          i.default.path().projectAssets +
          "/" +
          t +
          ".svg?cachebust=" +
          i.default.getConfig().version),
          n.setAttribute("alt", ""),
          this.sentenceImageContainer.appendChild(n);
      }),
      (n.prototype.renderConjunctive = function(t) {
        var n = document.createElement("span");
        n.classList.add("impact-sentence__conjunctive"),
          n.classList.add(t),
          (n.innerHTML = "or"),
          this.sentenceImageContainer.appendChild(n);
      }),
      (n.prototype.renderSentenceElement = function(t, n) {
        var e = document.createElement("span");
        e.classList.add("impact-sentence__text"),
          e.classList.add("impact-sentence__" + n + "--text"),
          (e.innerHTML = t),
          this.impactSentenceEl.appendChild(e);
      }),
      (n.prototype.setLandWaterTitle = function() {
        var t = (0, o.default)(
          "Never" === this.frequencyChoice
            ? "The average consumption of {{food_choice}} in the UK also uses"
            : (0, o.default)("Your consumption of {{food_choice}} also uses"),
          {
            food_choice: this.foodChoice.toLowerCase()
          }
        );
        this.renderSentenceElement(t, "subheading"),
          (this.isLandWaterTitleSet = !0);
      }),
      (n.prototype.constructSentence = function(t) {
        var n = {},
          e = void 0;
        switch (t) {
          case "GHG.sentence.1":
            var r = this.datahandler.getNumberOfMiles(
                this.foodChoice,
                this.frequencyChoice
              ),
              u = this.datahandler.getNumberOfKm(r);
            (e =
              "english" === i.default.getConfig().language
                ? this.datahandler.roundNumbersIfAppropriate(r, !1)
                : this.datahandler.roundNumbersIfAppropriate(u, !1)),
              this.renderConjunctive("impact-sentence__conjunctive--ghg1"),
              (n = {
                x: "" + e,
                y: "" + this.datahandler.roundNumbersIfAppropriate(u, !1)
              });
            break;
          case "GHG.sentence.2":
            if ("english" === i.default.getConfig().language) {
              (e = this.datahandler.roundNumbersIfAppropriate(
                this.datahandler.getNumberOfDays(
                  this.foodChoice,
                  this.frequencyChoice
                )
              )),
                (n.x = e),
                this.renderConjunctive("impact-sentence__conjunctive--ghg2");
              break;
            }
            n = null;
            break;
          case "GHG.sentence.3":
            var a =
              "english" === i.default.getConfig().language
                ? this.datahandler.getNumberOfFlights(
                    this.foodChoice,
                    this.frequencyChoice
                  )
                : this.datahandler.getNumberOfWSFlights(
                    this.foodChoice,
                    this.frequencyChoice
                  );
            if (a >= 1) {
              (n.x = Math.floor(a)),
                (e = n.x),
                this.renderConjunctive("impact-sentence__conjunctive--ghg3");
              break;
            }
            n = null;
            break;
          case "Land.sentence":
            var c = this.datahandler.roundNumbersIfAppropriate(
                this.datahandler.getLandUse(
                  this.foodChoice,
                  this.frequencyChoice
                ),
                !1
              ),
              f = Math.floor(
                this.datahandler.getNumberOfCourts(
                  this.foodChoice,
                  this.frequencyChoice
                )
              );
            this.renderConjunctive("impact-sentence__conjunctive--land"),
              (n =
                f >= 1
                  ? {
                      x: f,
                      area: c,
                      meters_squared: "m²"
                    }
                  : null),
              (e = f);
            break;
          case "Water.sentence":
            var s = this.datahandler.roundNumbersIfAppropriate(
                this.datahandler.getWaterUse(
                  this.foodChoice,
                  this.frequencyChoice
                ),
                !1
              ),
              l = Math.floor(
                this.datahandler.getNumberOfShowers(
                  this.foodChoice,
                  this.frequencyChoice
                )
              );
            this.renderConjunctive("impact-sentence__conjunctive--water"),
              (n =
                l > 5
                  ? {
                      x: l,
                      volume: s,
                      litres: "litres"
                    }
                  : null),
              (e = l);
        }
        return null !== n
          ? (0, o.default)(
              this.formatSentence(t, e),
              this.formatSentenceVariables(n)
            )
          : null;
      }),
      (n.prototype.formatSentenceVariables = function(t) {
        var n = this,
          e = {};
        return (
          Object.keys(t).forEach(function(r) {
            e[r] = n.datahandler.formatNumberForOutput(t[r]);
          }),
          e
        );
      }),
      (n.prototype.formatSentence = function(n, e) {
        return t(this.globalise(this.pluralOrSingular(e, n)));
      }),
      (n.prototype.pluralOrSingular = function(t, n) {
        return 1 === parseFloat(t) ? n + ".singular" : n;
      }),
      (n.prototype.globalise = function(t) {
        var n = t;
        return (
          Object.keys(i.default.getConfig().vocab).includes(t + "_ws") &&
            (n = "english" !== i.default.getConfig().language ? t + "_ws" : t),
          n
        );
      }),
      n
    );
  })();
  n.default = c;
}.call(this, e(49)));
