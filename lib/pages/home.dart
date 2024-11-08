import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weathermodels.dart';
import 'package:weather/service/weatherservices.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weatherService = WeatherService('41e95af1a434f147a80b32335e559a2e');

  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getweather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'snow':
        return 'assets/snow.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // Show a simple dialog to input city name (You can modify this to your needs)
  void _searchCity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text("Enter City Name"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter city'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (controller.text.isNotEmpty) {
                  _fetchWeatherByCity(controller.text);
                }
              },
              child: Text("Search"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Fetch weather by city name
  void _fetchWeatherByCity(String cityName) async {
    try {
      final weather = await _weatherService.getweather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.white, // Set the AppBar background color to white
        elevation: 0, // Optional: Remove shadow if needed
        centerTitle: true, // Center the title in the AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black), // Search icon
            onPressed: _searchCity, // Trigger search function when tapped
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Set the body background color to white
        child: Center(
          child: _weather == null
              ? CircularProgressIndicator() // Show a loading indicator while fetching weather data
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _weather?.cityName ?? "Loading city...",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
                    Text(
                      '${_weather!.temperature.round()}°C',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(_weather?.mainCondition ?? ""),
                  ],
                ),
        ),
      ),
    );
  }
}
