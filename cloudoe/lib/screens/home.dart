import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:cloudoe/style/utils.dart';
import 'package:cloudoe/widget/city_search.dart';
import 'package:cloudoe/widget/dataPrecipList.dart';
import 'package:cloudoe/widget/dataTempList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    handleLocationPermission(context);

    print(getUserPosition(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Cloudoe",
            style: bigTitle,
          )),
      body: SafeArea(
        child: Column(
          children: [
            const CitySearch(),
            const SizedBox(height: 20),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (value) {
                  ref.watch(displayedData.notifier).state = value!;
                  print("Sélectionné: ${ref.watch(displayedData)}");
                },
                hint: const Text('Sélectionnez une donnée'),
                items: [
                  'Température',
                  'Précipitations',
                  'Nuages',
                  'UV',
                  'Vent',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            displayWidget(ref.watch(displayedData)),
          ],
        ),
      ),
    );
  }

  Widget displayWidget(String option) {
    switch (option) {
      case 'Température':
        return DataTempListWidget();
      case 'Précipitations':
        return DataPrecipListWidget();
      case 'Nuages':
        return Text('Widget Nuages');
      case 'UV':
        return Text('Widget UV');
      case 'Vent':
        return Text('Widget Vent');
      default:
        return SizedBox();
    }
  }
}
