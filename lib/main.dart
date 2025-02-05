import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
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
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "";
  int? _temperature;
  String? _weatherCondition;
  List<Map<String, dynamic>> _weeklyForecast = [];

  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text.isNotEmpty ? _cityController.text : "Unknown City";
      _temperature = Random().nextInt(16) + 15; 
      List<String> conditions = ["Sunny", "Cloudy", "Rainy"];
      _weatherCondition = conditions[Random().nextInt(conditions.length)];
    });
  }

  void _fetchWeeklyForecast() {
    List<String> conditions = ["Sunny", "Cloudy", "Rainy"];
    setState(() {
      _weeklyForecast = List.generate(7, (index) {
        return {
          "day": "Day ${index + 1}",
          "temperature": Random().nextInt(16) + 15,
          "condition": conditions[Random().nextInt(conditions.length)],
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter City Name",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text("Fetch Weather"),
            ),
            ElevatedButton(
              onPressed: _fetchWeeklyForecast,
              child: const Text("Fetch 7-Day Forecast"),
            ),
            const SizedBox(height: 20),
            if (_temperature != null && _weatherCondition != null)
              Column(
                children: [
                  Text(
                    "Weather in $_cityName:",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_temperature°C, $_weatherCondition",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_weeklyForecast.isNotEmpty)
              Column(
                children: [
                  const Text(
                    "7-Day Weather Forecast:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ..._weeklyForecast.map((day) {
                    return Text(
                      "${day['day']}: ${day['temperature']}°C, ${day['condition']}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}