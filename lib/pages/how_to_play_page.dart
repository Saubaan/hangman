import '../components/title_art.dart';
import 'package:flutter/material.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TitleArt(
          height: screenWidth / 20.55,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: screenWidth,
              padding: const EdgeInsets.all(10),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 246, 130, 0)),
              child: Text(
                'How to play Hangman',
                style: TextStyle(
                    fontSize: screenWidth / 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    'Main objectives',
                    style: TextStyle(
                        fontSize: screenWidth / 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\n• You will need at least two players to play this game'
                    '\n• One person is the host and the other becomes a player.'
                    '\n• The objective of hangman is to guess the movie name before running out of guesses.'
                    '\n• A host selects a movie name or word without telling it to the players.'
                    '\n• Players can take turns or work together selecting letters to narrow the word down. '
                    '\n• Gameplay continues until the players guess the word/ movie name or they run out of guesses.',
                    style: TextStyle(fontSize: screenWidth / 22),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: screenWidth,
              padding: const EdgeInsets.all(10),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 246, 130, 0)),
              child: Text(
                'How to use the App',
                style: TextStyle(
                    fontSize: screenWidth / 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    '\nChoose one person to be the “host”.\n'
                    '\n• Enter the movie name in the input field and press enter button.'
                    '\n• Use space between two words for movie names with multiple words'
                    '\n• Do not enter special characters. Use letters and numbers only.\n',
                    style: TextStyle(
                        fontSize: screenWidth / 22,
                        fontWeight: FontWeight.bold),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      child: const Image(
                        image: AssetImage('assets/components/screenshot_1.png'),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  Text(
                    '\nStart guessing letters if you are the player. \n'
                    '\n• Click the letter players want to guess on the keyboard. '
                    '\n• The letter will appear in the box above the keyboard.'
                    '\n• If players want to choose other letter simply click the other letter.'
                    '\n• Click enter to confirm your guess.\n',
                    style: TextStyle(
                        fontSize: screenWidth / 22,
                        fontWeight: FontWeight.bold),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      child: const Image(
                        image: AssetImage('assets/components/screenshot_2.png'),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  Text(
                    '\n• If the guessed letter is present in the name then letter will appear in its respective position.'
                    '\n• If it is a wrong guess a heart will be deducted.'
                    '\n• If players run out of hearts the game is over and the host wins.'
                    '\n• If the players guess it before running out of hearts, the players win.'
                    '\n• If the players guess it when there are still many letter to be entered'
                    ' or they simply give up, instead of manually entering every letter '
                    'they can simply use the reveal button on the top right corner\n',
                    style: TextStyle(
                      fontSize: screenWidth / 22,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      child: const Image(
                        image: AssetImage('assets/components/screenshot_3.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
