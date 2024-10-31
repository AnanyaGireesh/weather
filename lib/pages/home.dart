import 'package:flutter/material.dart';
import 'package:weather/models/weathermodels.dart';
import 'package:weather/service/weatherservices.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _weatherService = WeatherService('41e95af1a434f147a80b32335e559a2e');

  Weather? _weather;
  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getweather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _weather?.cityName ?? "Loading city...",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (_weather != null) 
            Text(
              '${_weather!.temperature.round()}°C',
              style: TextStyle(fontSize: 20),
            )
          else
            CircularProgressIndicator(),
        ],
      ),
    ),
  );
}
}