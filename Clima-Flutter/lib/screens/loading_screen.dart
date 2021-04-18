import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$kWeatherAPIKey');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temp = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
