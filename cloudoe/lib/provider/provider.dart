import 'package:cloudoe/data/city.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foundCityProvider = StateProvider<City>((ref) => City());
final finalCityNameProvider = StateProvider<String>((ref) => "Paris");
final finalCityGeoProvider =
    StateProvider<List>((ref) => [2.333333, 48.866667]);

final isSearchingCity = StateProvider<bool>((ref) => false);

final weatherDataProvider = StateProvider<WeatherData>((ref) => WeatherData());
final next7Days = StateProvider<List>((ref) => List.generate(7, (index) {
      return DateTime.now().add(Duration(days: index));
    }));

final displayedData = StateProvider<String>((ref) => "Température");
