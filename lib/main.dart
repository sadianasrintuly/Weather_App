import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather2/weather_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String weather = '🌧';
  Color backgroundColor = Colors.indigo;
  String weather_temp = '';

  String test = '0';
  String test2 = '0.0';

  int conver_test = 0;
  double convert_test2 = 0.0;

  late Weathermodel weathermodel;


  get_weather() async{
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=5eddd8f41bf56dc79add0eac5eb717cd'));

    print(response.body);
    weathermodel =  weathermodelFromJson(response.body);

    setState(() {
      weather_temp = weathermodel.main.temp.toString();

      conver_test = int.parse(test);
      convert_test2 = double.parse(test2);

    });
  }

  @override
  void initState() {
    super.initState();
    get_weather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Weather',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings button press
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
          ],
        ),
        body: Container(
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.0), // Add spacing as needed
              Text(
                'Dhaka',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Updated: 12:41 AM',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50.0), // Add spacing as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    weather_temp,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '         max: 20°',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '         min: 11°',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                'Showers',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}