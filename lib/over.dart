// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nothing_game/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(
    //     const Duration(seconds: 500),
    //     () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const Homepage()),
    //         ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // const Divider(
            //   height: 240.0,
            //   color: Colors.white,
            // ),
            Image.asset(
              'assets/images/splash.jpg',
              height: 700,
            ),

            // OutlinedButton(
            //     onPressed: () {},
            //     child: const Text(
            //       'START',
            //       style: TextStyle(color: Colors.white),
            //     )),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    // AudioPlayer().play(
                    //   AssetSource('audio/bgm.mp3'),
                    // );
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
            const Divider(
              height: 105.2,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
