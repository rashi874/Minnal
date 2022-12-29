import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final double size;
  const MyBarrier({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: size,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 8, 4),
          border: Border.all(
              width: 5, color: const Color.fromARGB(255, 29, 30, 29)),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
