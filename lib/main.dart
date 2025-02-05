import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'City',
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
            'Input Your City Below',
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                // Your action here
              },
              child: Text(
                'Light Mode!',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
          ),
           ],
          ),
        ),
      ),
    );
  }