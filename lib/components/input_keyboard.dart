import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  final String alphabet;
  final Function(String) updateCurrentAlphabet;
  final double size;

  const KeyButton(
      {super.key,
      required this.alphabet,
      required this.updateCurrentAlphabet,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        updateCurrentAlphabet(alphabet);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(size*0.15),
          border: Border.all(color: Colors.black, width: 2),
        ),
        height: size,
        width: size,
        child: Center(
          child: Text(
            alphabet,
            style: TextStyle(fontFamily: 'RetroGame',fontSize: size*0.65, color: Colors.orange.shade900),
          ),
        ),
      ),
    );
  }
}
