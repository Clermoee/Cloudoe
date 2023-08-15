import 'package:cloudoe/data/city.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foundCityProvider = StateProvider<City>((ref) => City());
final finalCityNameProvider = StateProvider<String>((ref) => "");
final finalCityGeoProvider = StateProvider<List>((ref) => []);

final isSearchingCity = StateProvider<bool>((ref) => false);

final weatherDataProvider = StateProvider<WeatherData>((ref) => WeatherData());
