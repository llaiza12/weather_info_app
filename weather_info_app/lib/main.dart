import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Information App', // window title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlueAccent), // toolbar color
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Weather Information App'), // text on bar at top
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String city = '';
  String temp = "";
  String weather = "";

  // function that simulates fetching weather data
  void fetchWeather() {
    String userCity = _controller.text;

    final random = Random();
    int userTemp = 15 + random.nextInt(16);

    List<String> weatherTypes = ['Sunny', 'Cloudy', 'Rainy'];
    String userWeather = weatherTypes[random.nextInt(2)];

    setState(() {
      city = userCity;
      temp = "$userTemp";
      weather = userWeather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a city name',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // button pressed action
              },
              child: Text('Fetch Weather.'),
            ),

            // placeholders for weather data
            Text("City", style: TextStyle(fontSize: 18)),
            Text("temperature", style: TextStyle(fontSize: 18)),
            Text("weather", style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
