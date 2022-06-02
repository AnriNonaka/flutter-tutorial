import 'package:flutter/material.dart';
import 'building/building_layout_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter-tutorial'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Tutorial1'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuildLayoutScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}