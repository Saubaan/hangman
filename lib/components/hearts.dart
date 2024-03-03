import 'package:flutter/material.dart';

class HeartsList extends StatelessWidget {
  final int lives;
  final int notLives;
  final double size;
  const HeartsList({super.key, required this.lives, required this.notLives, required this.size});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(notLives, (index) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/components/_heart.png',
              height: size,
            ),
          ),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:List.generate(
            lives,
            (index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/components/heart.png',
                height: size,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
