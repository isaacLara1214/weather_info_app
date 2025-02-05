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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _temp = 0;
  String _weather = "Cloudy";
  var array = ["Cloudy", "Rain", "Sunny", "Snow", "Windy"];

  void _randomizeWeather() {
    setState(() {
      _weather = array[Random().nextInt(array.length)];
    });
  }

  void _randomizeTemp() {
    _randomizeWeather();
    setState(() {
      _temp = Random().nextInt(75) + 15;
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
          children: <Widget>[
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
            ),
            Text(
              '$_temp °',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _weather,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomizeTemp,
        tooltip: 'Refrest',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
