import 'dart:convert';

import 'package:cloudoe/data/city.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchCity(String city) async {
  final response = await http.get(Uri.parse(
      'https://geo.api.gouv.fr/communes?nom=$city&fields=nom,codesPostaux&format=geojson&geometry=centre'));
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception("Failed to fetch city");
  }
}

Future<City> getCityData(String city) async {
  var response = await fetchCity(city);
  return City.fromJson(jsonDecode(response.body));
}

Future<WeatherData> getWeatherData(double lat, double long) async {
  final response = await http.get(Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,uv_index_clear_sky_max,precipitation_sum,rain_sum,showers_sum,snowfall_sum,precipitation_hours,precipitation_probability_max,windspeed_10m_max,winddirection_10m_dominant&timeformat=unixtime&timezone=auto"));
  if (response.statusCode == 200) {
    print(WeatherData.fromJson(jsonDecode(response.body))
        .daily!
        .temperature2mMax);
    return WeatherData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to fetch weather data");
  }
}
