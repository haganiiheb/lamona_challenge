import '../apis/city.dart';

const String apiUrl = "d331156cbe923199b88c190ff9bc2225";
const String cityUrl = "http://api.geonames.org/searchJSON?";

// const String meda = "https://openweathermap.org/img/wn/10@2x.png";
String imageUrl(String icon) =>
    "https://openweathermap.org/img/wn/$icon@4x.png";

CityApi cityApi = CityApi.instance;
