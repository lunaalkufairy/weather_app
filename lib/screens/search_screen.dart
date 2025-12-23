import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, this.updateUi});
  VoidCallback? updateUi;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              //print(cityName);
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(
                cityName: cityName!,
              );
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              //updateUi!();
              Navigator.pop(context);
            },
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(25),
              hintText: 'Enter a City',
              hintStyle: const TextStyle(color: Colors.black54),
              labelText: 'Search',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weather = await service.getWeather(
                      cityName: cityName!,
                    );
                    Provider.of<WeatherProvider>(
                      context,
                      listen: false,
                    ).weatherData = weather;
                    Provider.of<WeatherProvider>(
                      context,
                      listen: false,
                    ).cityName = cityName;
                    //updateUi!();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
