import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataListWidget extends ConsumerStatefulWidget {
  const DataListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends ConsumerState<DataListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWeatherData(ref.watch(finalCityGeoProvider)[0],
            ref.watch(finalCityGeoProvider)[1]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherData data = snapshot.data as WeatherData;
            return SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.daily!.time!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                            data.daily!.temperature2mMax![index] >= 27
                                ? "assets/images/Hot_.jpg"
                                : "assets/images/Cold_.jpg"),
                      ),
                      Text('${data.daily!.temperature2mMax![index]}ºC'),
                    ]),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
