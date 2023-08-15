import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:cloudoe/style/utils.dart';
import 'package:cloudoe/widget/city_search.dart';
import 'package:cloudoe/widget/dataList.dart';
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
      body: const SafeArea(
        child: Column(
          children: [CitySearch(), DataListWidget()],
        ),
      ),
    );
  }
}
