import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '../models/weathermodels.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getweather(String cityName) async {
    print((Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric')));
    print('cityName $cityName');
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    // Request permission if not granted already
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are still denied, return a default or error message
        return 'Location permission denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle appropriately
      return 'Location permission denied permanently. Please enable it from settings.';
    }

    try {
      // Get the user's current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
      );

      // Reverse geocode to get the city
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String? city = placemarks[0].locality;

    return city ?? "thrissur";
    } catch (e) {
      print("Error: $e");
      return 'thrissur';
    }
  }
}
