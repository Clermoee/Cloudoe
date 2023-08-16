import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:cloudoe/style/utils.dart';
import 'package:cloudoe/widget/city_search.dart';
import 'package:cloudoe/widget/displayedData/data_precip_list.dart';
import 'package:cloudoe/widget/displayedData/data_uv_list.dart';
import 'package:cloudoe/widget/displayedData/data_temp_list.dart';
import 'package:cloudoe/widget/displayedData/data_wind_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                },
                hint: const Text('Sélectionnez une donnée'),
                items: [
                  'Température',
                  'Précipitations',
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
        return const DataTempListWidget();
      case 'Précipitations':
        return const DataPrecipListWidget();
      case 'UV':
        return const DataUVListWidget();
      case 'Vent':
        return const DataWindListWidget();
      default:
        return const SizedBox();
    }
  }
}
