import 'package:cloudoe/data/queries.dart';
import 'package:cloudoe/data/weather.dart';
import 'package:cloudoe/provider/provider.dart';
import 'package:cloudoe/style/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DataWindListWidget extends ConsumerStatefulWidget {
  const DataWindListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends ConsumerState<DataWindListWidget> {
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
                  final currentDayName =
                      DateFormat('EEEE d', 'fr_FR').format(DateTime.now());
                  final tommorowDay = DateFormat('EEEE d', 'fr_FR')
                      .format(DateTime.now().add(const Duration(days: 1)));
                  final dayName = DateFormat('EEEE d', 'fr_FR')
                      .format(ref.watch(next7Days)[index]);
                  return SizedBox(
                    width: 150,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(children: [
                        const SizedBox(height: 10),
                        Text(
                            dayName != currentDayName
                                ? dayName != tommorowDay
                                    ? dayName.toUpperCase()
                                    : "DEMAIN"
                                : "AUJOURD'HUI",
                            style: dayTitle),
                        Container(
                            margin: const EdgeInsets.all(10),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black45),
                            child: displayImage(
                                data.daily!.windspeed10mMax![index])),
                        Text('${data.daily!.windspeed10mMax![index]} km/h'),
                      ]),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget displayImage(double wind) {
    String imagePath = 'assets/images/';
    if (wind == 0.0) {
      imagePath += 'Not_Windy.png';
    } else if (wind <= 50.0) {
      imagePath += 'Windy_.png';
    } else if (wind <= 90.0) {
      imagePath += 'Heavy_Windy_.png';
    } else {
      imagePath += 'Very_Heavy_Windy_.png';
    }

    return Image.asset(imagePath);
  }
}
