import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather2/weather_model.dart';
import 'package:http/http.dart' as http;
class weather_api extends StatefulWidget {
  const weather_api({super.key});

  @override
  State<weather_api> createState() => _weather_apiState();
}

class _weather_apiState extends State<weather_api> {


  String weather_temp = '';
  String weather_description = '';
  String weather_visibility = '';

String test = "25";
String test2 = "2.2";

int convert_test = 0;
double convert_test2 = 0.0;

 late Weathermodel weathermodel;

   get_weather() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=02aac25dbe80caffe563f22e61529590"));

    print(response.body);

    weathermodel = weathermodelFromJson(response.body);

    setState(() {
      weather_temp = weathermodel.main.temp.toString();
      weather_visibility = weathermodel.visibility.toString();
    });

    convert_test = int.parse(test);
        convert_test2 = double.parse(test2);

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_weather();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather API"),
        ),
        body: Container(
        child: Text(weather_temp),
       ),
      ),
    );

  }
}
