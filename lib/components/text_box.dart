import 'package:flutter/cupertino.dart';

class MyTextBox extends StatelessWidget{
  final String letter;
  final double fontSize;
  final double size;
  const MyTextBox({super.key,required this.letter, required this.size, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(fontSize: fontSize,),
        ),
      ),
    );
  }
}