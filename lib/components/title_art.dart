import 'package:flutter/material.dart';

class TitleArt extends StatelessWidget {
  final double height;
  const TitleArt({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage('assets/title/H.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/A.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/N.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/G.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/M.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/A.png'),
          height: height,
        ),
        Image(
          image: const AssetImage('assets/title/N.png'),
          height: height,
        ),
      ],
    );
  }
}
