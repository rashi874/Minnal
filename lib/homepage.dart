import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nothing_game/avatar.dart';
import 'package:nothing_game/mybarrier.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double avatarYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameStarted = false;
  double barrierXOne = 1;
  double barrierXTwo = 1.5;
  int score = 0;
  int highScore = 0;
  Timer? gameTimer;

  @override
  void initState() {
    super.initState();
    highScore = getHighScore();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  void jump() {
    if (!gameStarted) {
      startGame();
    } else {
      setState(() {
        time = 0;
        initialHeight = avatarYAxis;
      });
    }
  }

  void startGame() {
    setState(() {
      gameStarted = true;
      score = 0;
      avatarYAxis = 0;
      barrierXOne = 1;
      barrierXTwo = 1.5;
    });
    gameTimer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        avatarYAxis = initialHeight - height;
      });
      setState(() {
        if (barrierXOne < -2) {
          barrierXOne += 3.5;
        } else {
          barrierXOne -= 0.05;
        }
      });
      setState(() {
        if (barrierXTwo < -2) {
          barrierXTwo += 3.5;
        } else {
          barrierXTwo -= 0.05;
        }
      });
      if (avatarYAxis > 1.5) {
        timer.cancel();
        endGame();
      }
      if (gameStarted) {
        setState(() {
          score++;
        });
      }
    });
  }

  void endGame() {
    gameStarted = false;
    if (score > highScore) {
      setHighScore(score);
      highScore = score;
    }
  }

  void setHighScore(int score) {
    // Save the high score in local storage or database
  }

  int getHighScore() {
    // Retrieve the high score from local storage or database
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: jump,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(0, avatarYAxis),
              child: const Avatar(),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(barrierXOne, 0.9),
              child: const MyBarrier(size: 200.0),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(barrierXOne, -1.1),
              child: const MyBarrier(size: 200.0),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(barrierXTwo, -0.5),
              child: const MyBarrier(size: 200.0),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(barrierXTwo, 1.9),
              child: Image.asset(
                'assets/images/wheel.png',
                height: 500,
                width: 100,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              alignment: Alignment(barrierXOne, -2.1),
              child: Image.asset(
                'assets/images/sky.png',
                height: 700,
                width: 150,
              ),
            ),
            if (!gameStarted)
              Align(
                alignment: Alignment(0, -0.3),
                child: Text(
                  'T A P   T O   P L A Y',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (!gameStarted && highScore > 0)
              Align(
                alignment: Alignment(0, 0.3),
                child: Text(
                  'Best Score: $highScore',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            if (!gameStarted)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (!gameStarted && highScore == 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'No High Score Yet',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (!gameStarted)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            if (!gameStarted && highScore > 0)
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 50,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            avatarYAxis = 0;
                            time = 0;
                            height = 0;
                            initialHeight = 0;
                            gameStarted = false;
                            barrierXOne = 1;
                            barrierXTwo = 1.5;
                            score = 0;
                            highScore = 0;
                          });
                          // startGame();
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Tap to Play',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
