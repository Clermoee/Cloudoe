import 'dart:convert';

import 'package:cloudoe/data/city.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
    return WeatherData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to fetch weather data");
  }
}

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<List> getUserPosition(BuildContext context) async {
  final hasPermission = await handleLocationPermission(context);
  if (!hasPermission) return [];
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return [position.latitude, position.longitude];
}
