// ignore_for_file: unused_field

import 'package:cloudoe/data/city.dart';
import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class CitySearch extends ConsumerStatefulWidget {
  const CitySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CitySearchState();
}

class _CitySearchState extends ConsumerState<CitySearch> {
  final _cityController = TextEditingController();
  late String _cityValue;
  late City _cityFound;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cityValue = '';

    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = ref.watch(isSearchingCity);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 20),
        TextField(
          controller: _cityController,
          decoration: const InputDecoration(label: Text("Ville")),
          onChanged: (value) async {
            _cityFound = await getCityData(_cityController.text);
            setState(() {
              ref.watch(foundCityProvider.notifier).state = _cityFound;
            });
            _cityController.text != ""
                ? ref.watch(isSearchingCity.notifier).state = true
                : ref.watch(isSearchingCity.notifier).state = false;
          },
        ),
        isSearching
            ? SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: _cityFound.features!.length,
                  separatorBuilder: (context, index) {
                    return const Divider(thickness: 1);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        _cityController.text =
                            (_cityFound.features?[index].properties?.nom)!;
                        ref.watch(finalCityNameProvider.notifier).state =
                            _cityController.text;
                        ref.watch(finalCityGeoProvider.notifier).state =
                            _cityFound.features![index].geometry!.coordinates!;
                        ref.watch(isSearchingCity.notifier).state = false;
                        await getWeatherData(ref.watch(finalCityGeoProvider)[0],
                            ref.watch(finalCityGeoProvider)[1]);
                      },
                      title:
                          Text((_cityFound.features?[index].properties?.nom)!),
                      subtitle: Text((_cityFound
                          .features?[index].properties?.codesPostaux?[0])!),
                    );
                  },
                ),
              )
            : Container(),
      ]),
    );
  }
}
