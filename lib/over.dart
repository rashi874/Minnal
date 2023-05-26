import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nothing_game/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  AudioPlayer().play(
                    AssetSource('audio/bgm.mp3'),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return const Homepage();
                      }),
                    ),
                  );
                },
                child: const Text(
                  'START',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                )),
          ),
        ),
      ),
    );
  }
}
