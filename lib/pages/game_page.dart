import 'package:android_hangman/components/title_art.dart';
import 'package:flutter/material.dart';
import '../pages/input_page.dart';
import '../components/hearts.dart';
import '../components/image_button.dart';
import '../components/input_keyboard.dart';
import '../components/text_box.dart';

class GamePage extends StatefulWidget {
  final String movieName;
  const GamePage({super.key, required this.movieName});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List<String> guessedLetters = [' '];
  int lives = 7;
  int notLives = 0;
  String currentAlphabet = '';
  final TextEditingController textEditingController = TextEditingController();
  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double keySize = screenWidth/12;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: TitleArt(height: screenWidth/20.55)
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth/20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeartsList(lives: lives, notLives: notLives, size: screenWidth/19,),
                      ImageButton(
                        onPressed: _revealLetters,
                        imagePath1: 'assets/components/_reveal.png',
                        height: screenWidth/10,
                      ),
                    ],
                  ),
                ),

                // Expanded(child: Container()),
                Wrap(
                  spacing: 1.0,
                  runSpacing: 7.0,
                  alignment: WrapAlignment.center,
                  children: _buildWordBoxes(screenWidth/10.25, screenWidth/16.5),
                ),

                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black, width: 4),
                              ),
                              child: Center(
                                child: Text(
                                  currentAlphabet,
                                  style: TextStyle(
                                      fontFamily: 'RetroGame',
                                      fontSize: screenWidth/15,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth/20,
                            ),
                            InkWell(
                              onTap: () {
                                if (currentAlphabet != '') {
                                  _checkGuess(currentAlphabet, screenWidth);
                                  currentAlphabet = '';
                                }
                              },
                              child: Image(
                                image:
                                    const AssetImage('assets/components/enter.png'),
                                height: screenWidth/8.25,
                              ),
                            )
                          ],
                        ),
                      ),
                      buildRow(['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'], keySize),
                      buildRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'], keySize),
                      buildRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'], keySize),
                      buildRow(['Z', 'X', 'C', 'V', 'B', 'N', 'M'], keySize),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _revealLetters() {
    setState(() {
      _showNameRevealPopup(MediaQuery.of(context).size.width);
    });
  }

  List<Widget> _buildWordBoxes(double size, double fontSize) {
    List<String> words = widget.movieName.split(' ');

    List<Widget> rows = [];

    for (String word in words) {
      List<Widget> letterBoxes = [];

      for (int i = 0; i < word.length; i++) {
        // Display a box for each letter
        letterBoxes.add(
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: MyTextBox(
                fontSize: fontSize,
                size: size,
                letter: guessedLetters.contains(word[i]) ? word[i] : ' '),
          ),
        );
      }
      if(word != words[words.length -1]){
        letterBoxes.add(
          const SizedBox(width: 20), // Adjust spacing if needed
        );
      }

      // Add a row for each word
      rows.add(
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 1,
          spacing: 1,
          children: letterBoxes,
        ),
      );
    }

    return rows;
  }

  Widget buildRow(List<String> alphabets, double boxSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: alphabets
          .map((alphabet) => Padding(
            padding:  EdgeInsets.all(screenWidth/240),
            child: KeyButton(
              alphabet: alphabet,
              updateCurrentAlphabet: updateCurrentAlphabet,
              size: boxSize,
            ),
          ))
          .toList(),
    );
  }

  void _checkGuess(String guessedLetter, double screenWidth) {
    setState(
      () {
        if (!guessedLetters.contains(guessedLetter)) {
          guessedLetters.add(guessedLetter);

          if (!widget.movieName.contains(guessedLetter)) {
            lives--;
            notLives++;

            if (lives == 0) {
              _showGameOverPopup(screenWidth);
            }
          } else if (widget.movieName.contains(guessedLetter)) {
            bool gameWon = true;
            for (int i = 0; i < widget.movieName.length; i++) {
              if (guessedLetters.contains(widget.movieName[i])) {
                gameWon = true;
              } else {
                gameWon = false;
                break;
              }
            }
            if (gameWon) {
              _showGameWonPopup(screenWidth);
            }
          }
        } else if (guessedLetters.contains(guessedLetter) &&
            !widget.movieName.contains(guessedLetter)) {
          lives--;
          notLives++;
          if (lives == 0) {
            _showGameOverPopup(screenWidth);
          }
        }
      },
    );
  }

  void updateCurrentAlphabet(String newAlphabet) {
    setState(() {
      currentAlphabet = newAlphabet;
    });
  }

  void _showGameWonPopup(double screenWidth) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: PopScope(
            canPop: false,
            child: AlertDialog(
              title: Image(
                image: const AssetImage('assets/components/game_won.png'),
                height: screenWidth/2.75,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.movieName,
                    style: TextStyle(
                        fontSize: screenWidth/20, fontWeight: FontWeight.bold),
                  ),
                   Text(
                    'Hurray!',
                    style: TextStyle(fontSize: screenWidth/18,),
                  ),
                   Text(
                    'You Guessed it right!',
                    style: TextStyle(
                      fontSize: screenWidth/20,
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: const AssetImage('assets/components/home.png'),
                        height: screenWidth/12,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const InputPage()));
                      },
                      child: Image(
                        image: const AssetImage('assets/components/play_again.png'),
                        height: screenWidth/12,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  void _showNameRevealPopup(double screenWidth) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: PopScope(
            canPop: false,
            child: AlertDialog(
              title: Image(
                image: const AssetImage('assets/components/game_won.png'),
                height: screenWidth/2.75,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.movieName,
                    style: TextStyle(
                        fontSize: screenWidth/20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Name was revealed',
                    style: TextStyle(fontSize: screenWidth/18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: const AssetImage('assets/components/home.png'),
                        height: screenWidth/12,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const InputPage()));
                      },
                      child: Image(
                        image: const AssetImage('assets/components/play_again.png'),
                        height: screenWidth/12,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  void _showGameOverPopup(double screenWidth) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Image(
                image: AssetImage('assets/components/game_over.png'),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'The movie was',
                    style: TextStyle(
                      fontSize: screenWidth/20,
                    ),
                  ),
                  Text(
                    widget.movieName,
                    style: TextStyle(fontSize: screenWidth/18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: const AssetImage('assets/components/home.png'),
                        height: screenWidth/12,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const InputPage()));
                      },
                      child: Image(
                        image: const AssetImage('assets/components/play_again.png'),
                        height: screenWidth/12,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
