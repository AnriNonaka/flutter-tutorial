import 'package:flutter/material.dart';
import 'package:flutter_tutorial/residence/residence_screen.dart';
import 'package:flutter_tutorial/youtube/youtube_screen.dart';
import 'animation/animation_screen.dart';
import 'building/building_layout_screen.dart';
import 'merukari/merukari_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Tutorial',
        home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メイン画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Tutorial1'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuildLayoutScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Tutorial1-1'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoApp(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('YouTube'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YoutubeScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Tutorial2-2'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResidenceScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Tutorial2-3'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MerukariScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}