import 'package:android_hangman/components/title_art.dart';
import 'package:flutter/material.dart';
import '../components/image_button.dart';
import '../pages/game_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController textEditingController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TitleArt(height: screenWidth/20.55),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth/9),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Rules : ',
                  style: TextStyle(
                      fontFamily: 'PixelifySans', fontSize: screenWidth / 20),
                ),
                Text(
                  '1. Do not add special characters (,.\'"?!).\n',
                  style: TextStyle(
                      fontFamily: 'PixelifySans', fontSize: screenWidth / 25),
                ),
                Text(
                  '2. Use Space to separate words in movie names with multiple words.',
                  style: TextStyle(
                      fontFamily: 'PixelifySans', fontSize: screenWidth / 25),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 36,
              controller: textEditingController,
              textAlign: TextAlign.center,
              autofocus: true,
              onSubmitted: (text) {
                if (text != '') {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GamePage(movieName: text.toUpperCase())),
                  );
                  textEditingController.clear();
                }
              },
              decoration: InputDecoration(
                focusColor: const Color.fromARGB(255, 255, 0, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter Movie name',
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'PixelifySans',
                    fontSize: 20),
              ),
              obscureText: isObscure,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),

                ),
                const SizedBox(
                  width: 20,
                ),
                ImageButton(
                  onPressed: () {
                    String movieName = textEditingController.text;
                    if (movieName != '') {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GamePage(movieName: movieName.toUpperCase())),
                      );
                      textEditingController.clear();
                    }
                  },
                  imagePath1: 'assets/components/enter.png',
                  height: MediaQuery.of(context).size.width / 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
