import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nothing_game/avatar.dart';
import 'package:nothing_game/mybarrier.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static double avatarYasxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = avatarYasxis;
  bool gameHasStarted = false;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 1.5;
  int score = 0;
  num highscore = 10;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = avatarYasxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        avatarYasxis = initialHeight - height;
      });
      setState(() {
        if (barrierXone < -2) {
          barrierXone += 3.5;
        } else {
          barrierXone -= 0.05;
        }
      });
      setState(() {
        if (barrierXtwo < -2) {
          barrierXtwo += 3.5;
        } else {
          barrierXtwo -= 0.05;
        }
      });
      if (avatarYasxis > 1.5) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog(context);
      }
    });
  }

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              "Game Over",
              style: TextStyle(color: Colors.white),
            ),
            // content: Text("Score" + score.toString()),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    if (score > highscore) {
                      highscore = score;
                    }

                    setState(() {
                      gameHasStarted = false;
                      avatarYasxis = 0;
                    });

                    // Navigator.pop(true);
                    // Navigator.maybePop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Homepage();
                    })));
                  },
                  child: const Text(
                    'Play Again',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      }),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      AnimatedContainer(
                        alignment: Alignment(
                          0,
                          avatarYasxis,
                        ),

                        duration: const Duration(milliseconds: 0),
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            // backgroundBlendMode: BlendMode?,

                            image: DecorationImage(
                          scale: 2.0,
                          colorFilter: ColorFilter.mode(
                              const Color.fromARGB(255, 46, 103, 218)
                                  .withOpacity(1.0),
                              BlendMode.softLight),
                          image: const AssetImage(
                            'assets/images/background.png',
                          ),
                          fit: BoxFit.fitHeight,
                        )),
                        child: const Avatar(),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, 0.9),
                        duration: const Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, -1.1),
                        duration: const Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, -0.5),
                        duration: const Duration(milliseconds: 0),
                        child:
                            // Image.asset(
                            //   'assets/images/sky.png',
                            //   height: 300,
                            //   width: 400,
                            // ),
                            const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXtwo, 1.9),
                        duration: const Duration(milliseconds: 0),
                        child: Image.asset(
                          'assets/images/wheel.png',
                          height: 500,
                          width: 100,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierXone, -2.1),
                        duration: const Duration(milliseconds: 0),
                        child: Image.asset(
                          'assets/images/sky.png',
                          height: 700,
                          width: 150,
                        ),
                      ),
                      Container(
                        alignment: const Alignment(0, -0.3),
                        child: gameHasStarted
                            ? const Text(" ")
                            : const Text(
                                'T A P T O P L A Y',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 248, 247, 247)),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ],
                  ),
                )),

            // Expanded(
            //     child: Container(
            //   height: 20,
            //   color: const Color.fromARGB(255, 18, 35, 61),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const [
            //           Text(
            //             "SCORE",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 35,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Text(
            //             "0",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 35,
            //             ),
            //           )
            //         ],
            //       ),
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const [
            //           Text(
            //             "BEST",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 35,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Text(
            //             "10",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 35,
            //             ),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // )),
          ],
        ),
      ),
    );
  }
}
