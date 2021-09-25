import 'package:flutter/material.dart';
import 'package:stratos/extensions/string_extension.dart';
import 'package:stratos/models/json/one_call.dart';
import 'package:stratos/services/temp.dart';
import 'package:stratos/services/time.dart';
import 'package:stratos/widgets/icons/weather_icon_hourly.dart';

var someCapitalizedString = "someString".capitalize();

class HourlyTile extends StatelessWidget {
  const HourlyTile({Key? key, required this.response, required this.index})
      : super(key: key);

  final int index;
  final Onecall? response;
  @override
  Widget build(BuildContext context) {
    final String pop = (response!.hourly![index].pop! * 100).toInt().toString();
    return FittedBox(
      fit: BoxFit.cover,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            TimeHelper.getReadableTime(TimeHelper.getDateTimeSinceEpoch(
                response!.hourly![index].dt, response!.timezoneOffset)),
            style: const TextStyle(
              fontFamily: 'Proxima',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Text(
            pop + "%",
            style: TextStyle(
              fontFamily: 'Proxima',
              color: Colors.grey.shade700,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 75,
            width: 75,
            child: WeatherIconHourly(
              response: response,
              index: index,
            ),
          ),
          Text(
            TempHelper.getReadableTemp(
                response!.hourly![index].temp!.round().toString()),
            style: const TextStyle(
              fontFamily: 'Proxima',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
