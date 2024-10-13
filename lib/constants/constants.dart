Map<int, String> weatherImages = {
  // Group 2xx: Thunderstorm
  200: "assets/images/rain_thunder.png",
  201: "assets/images/rain_thunder.png",
  202: "assets/images/rain_thunder.png",
  210: "assets/images/rain_thunder.png",
  211: "assets/images/rain_thunder.png",
  212: "assets/images/rain_thunder.png",
  221: "assets/images/rain_thunder.png",
  230: "assets/images/rain_thunder.png",
  231: "assets/images/rain_thunder.png",
  232: "assets/images/rain_thunder.png",

  // Group 3xx: Drizzle
  300: "assets/images/rain.png",
  301: "assets/images/rain.png",
  302: "assets/images/rain.png",
  310: "assets/images/rain.png",
  311: "assets/images/rain.png",
  312: "assets/images/rain.png",
  313: "assets/images/rain.png",
  314: "assets/images/rain.png",
  321: "assets/images/rain.png",

  // Group 5xx: Rain
  500: "assets/images/rain.png",
  501: "assets/images/rain.png",
  502: "assets/images/rain.png",
  503: "assets/images/rain.png",
  504: "assets/images/rain.png",
  511: "assets/images/rain.png",
  520: "assets/images/rain.png",
  521: "assets/images/rain.png",
  522: "assets/images/rain.png",
  531: "assets/images/rain.png",

  // Group 6xx: Snow
  600: "assets/images/snow.png",
  601: "assets/images/snow.png",
  602: "assets/images/snow.png",
  611: "assets/images/sleet.png",
  612: "assets/images/sleet.png",
  613: "assets/images/sleet.png",
  615: "assets/images/rain_snow.png",
  616: "assets/images/rain_snow.png",
  620: "assets/images/snow.png",
  621: "assets/images/snow.png",
  622: "assets/images/snow.png",

  // Group 7xx: Atmosphere
  701: "assets/images/fog.png",
  711: "assets/images/fog.png",
  721: "assets/images/fog.png",
  731: "assets/images/fog.png",
  741: "assets/images/fog.png",
  751: "assets/images/fog.png",
  761: "assets/images/fog.png",
  762: "assets/images/fog.png",
  771: "assets/images/wind.png",
  781: "assets/images/tornado.png",

  // Group 800: Clear
  800: "assets/images/day_clear.png",

  // Group 80x: Clouds
  801: "assets/images/day_partial_cloud.png",
  802: "assets/images/day_partial_cloud.png",
  803: "assets/images/angry_clouds.png",
  804: "assets/images/overcast.png",
};

Map<int, Map<String, String>> weatherDescriptions = {
  // Group 2xx: Thunderstorm
  200: {"en": "Thunderstorm with light rain", "fr": "Orage avec pluie légère"},
  201: {"en": "Thunderstorm with rain", "fr": "Orage avec pluie"},
  202: {"en": "Thunderstorm with heavy rain", "fr": "Orage avec forte pluie"},
  210: {"en": "Light thunderstorm", "fr": "Orage léger"},
  211: {"en": "Thunderstorm", "fr": "Orage"},
  212: {"en": "Heavy thunderstorm", "fr": "Fort orage"},
  221: {"en": "Ragged thunderstorm", "fr": "Orage déchiré"},
  230: {
    "en": "Thunderstorm with light drizzle",
    "fr": "Orage avec bruine légère"
  },
  231: {"en": "Thunderstorm with drizzle", "fr": "Orage avec bruine"},
  232: {
    "en": "Thunderstorm with heavy drizzle",
    "fr": "Orage avec forte bruine"
  },

  // Group 3xx: Drizzle
  300: {"en": "Light intensity drizzle", "fr": "Bruine légère"},
  301: {"en": "Drizzle", "fr": "Bruine"},
  302: {"en": "Heavy intensity drizzle", "fr": "Forte bruine"},
  310: {"en": "Light intensity drizzle rain", "fr": "Pluie légère avec bruine"},
  311: {"en": "Drizzle rain", "fr": "Pluie avec bruine"},
  312: {"en": "Heavy drizzle rain", "fr": "Forte pluie avec bruine"},
  313: {"en": "Shower rain and drizzle", "fr": "Averses et bruine"},
  314: {
    "en": "Heavy shower rain and drizzle",
    "fr": "Fortes averses et bruine"
  },
  321: {"en": "Shower drizzle", "fr": "Averse de bruine"},

  // Group 5xx: Rain
  500: {"en": "Light rain", "fr": "Pluie légère"},
  501: {"en": "Moderate rain", "fr": "Pluie modérée"},
  502: {"en": "Heavy intensity rain", "fr": "Pluie forte"},
  503: {"en": "Very heavy rain", "fr": "Pluie très forte"},
  504: {"en": "Extreme rain", "fr": "Pluie extrême"},
  511: {"en": "Freezing rain", "fr": "Pluie verglaçante"},
  520: {"en": "Light shower rain", "fr": "Averses légères"},
  521: {"en": "Shower rain", "fr": "Averses"},
  522: {"en": "Heavy shower rain", "fr": "Fortes averses"},
  531: {"en": "Ragged shower rain", "fr": "Averses déchirées"},

  // Group 6xx: Snow
  600: {"en": "Light snow", "fr": "Neige légère"},
  601: {"en": "Snow", "fr": "Neige"},
  602: {"en": "Heavy snow", "fr": "Neige forte"},
  611: {"en": "Sleet", "fr": "Neige fondue"},
  612: {"en": "Light shower sleet", "fr": "Averses légères de neige fondue"},
  613: {"en": "Shower sleet", "fr": "Averses de neige fondue"},
  615: {"en": "Light rain and snow", "fr": "Pluie et neige légères"},
  616: {"en": "Rain and snow", "fr": "Pluie et neige"},
  620: {"en": "Light shower snow", "fr": "Averses légères de neige"},
  621: {"en": "Shower snow", "fr": "Averses de neige"},
  622: {"en": "Heavy shower snow", "fr": "Fortes averses de neige"},

  // Group 7xx: Atmosphere
  701: {"en": "Mist", "fr": "Brume"},
  711: {"en": "Smoke", "fr": "Fumée"},
  721: {"en": "Haze", "fr": "Brume sèche"},
  731: {"en": "Sand/dust whirls", "fr": "Tourbillons de sable/poussière"},
  741: {"en": "Fog", "fr": "Brouillard"},
  751: {"en": "Sand", "fr": "Sable"},
  761: {"en": "Dust", "fr": "Poussière"},
  762: {"en": "Volcanic ash", "fr": "Cendre volcanique"},
  771: {"en": "Squalls", "fr": "Rafales"},
  781: {"en": "Tornado", "fr": "Tornade"},

  // Group 800: Clear
  800: {"en": "Clear sky", "fr": "Ciel dégagé"},

  // Group 80x: Clouds
  801: {"en": "Few clouds", "fr": "Quelques nuages"},
  802: {"en": "Scattered clouds", "fr": "Nuages épars"},
  803: {"en": "Broken clouds", "fr": "Nuages fragmentés"},
  804: {"en": "Overcast clouds", "fr": "Ciel couvert"},
};
