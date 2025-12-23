import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String icon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.icon});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: data['current']['temp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherState: jsonData['condition']['text'],
        icon: 'https:${jsonData['condition']['icon']}');
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp  date = $date';
  }

  // String getImage() {
  //   if (weatherState == 'Clear' || weatherState=='Light Cloud') {
  //     return 'assets/images/clear.png';
  //   }else if(weatherState == '...'){

  //   }.
  //   .
  //   .
  //   .
  //   . else{
  //       return 'assets/images/clear.png';
  //   }
  // }

  MaterialColor getThemeColor() {
    switch (weatherState) {
      case 'Sunny' || 'Clear':
        return Colors.orange;
      case 'Partly cloudy' || 'Cloudy' || 'Overcast':
        return Colors.blueGrey;
      case 'Mist' ||
            'Patchy snow possible' ||
            'Patchy sleet possible' ||
            'Patchy freezing drizzle possible' ||
            'Blowing snow' ||
            'Blizzard' ||
            'Fog' ||
            'FreezingFog':
        return Colors.grey;
      case 'Patchy rain possible' || 'Moderate rain':
        return Colors.blue;
      default:
        return Colors.pink;
    }
  }
}
