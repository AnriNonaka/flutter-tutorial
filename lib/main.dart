import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/residence/residence_screen.dart';
import 'package:flutter_tutorial/youtube/youtube_top_screen.dart';
import 'animation/animation_screen.dart';
import 'async/async_screen.dart';
import 'building/building_layout_screen.dart';
import 'merukari/merukari_screen.dart';
import 'mvvm/qiita_top_screen.dart';

void main() => runApp(
    //これは必須
    const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Tutorial', home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  //プログレスインジケーターの表示
  void showProgressDialog(context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

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
                      builder: (context) => const YoutubeScreen(),
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
                      builder: (context) => ResidenceScreen(),
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
              ElevatedButton(
                child: const Text('async'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AsyncScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Tutorial5'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QiitaTopScreen(),
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
