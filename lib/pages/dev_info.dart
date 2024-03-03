import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevInfoPage extends StatelessWidget {
  const DevInfoPage({super.key});
  launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Devs died at $url lol';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(fontFamily: 'RetroGame'),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 130, 0),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            Text('Meet the devs:',style: TextStyle(fontFamily: 'RetroGame', fontSize: screenWidth*0.05),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 215, 171),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.developer_board, size: screenWidth*0.15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        'App behaviour logic, UI/UX by',
                        style: TextStyle(fontSize: screenWidth * 0.03),
                      ),
                        Text(
                          'Saubaan Shaikh',
                          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        ),

                        Row(
                          children: [
                            Text(
                              'Follow at: ',
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            IconButton(
                              onPressed: () {
                                const String url =
                                    'https://www.linkedin.com/in/saubaan-shaikh-277958258';
                                launchURL(url);
                              },
                              icon: FittedBox(
                                child: Image(
                                  image: const AssetImage(
                                      'assets/components/linkedin.png'),
                                  height: screenWidth * 0.075,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                const String url = 'https://github.com/Saubaan';
                                launchURL(url);
                              },
                              icon: FittedBox(
                                child: Image(
                                  image: const AssetImage(
                                      'assets/components/github.png'),
                                  height: screenWidth * 0.075,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 215, 171),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.developer_mode_rounded, size: screenWidth*0.15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Game logic and Illustrations by',
                          style: TextStyle(fontSize: screenWidth * 0.03),
                        ),
                        Text(
                          'Rushan Shaikh',
                          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        ),

                        Row(
                          children: [
                            Text(
                              'Follow at: ',
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            IconButton(
                              onPressed: () {
                                const String url =
                                    'https://www.linkedin.com/in/rushan-shaikh-150348259';
                                launchURL(url);
                              },
                              icon: FittedBox(
                                child: Image(
                                  image: const AssetImage(
                                      'assets/components/linkedin.png'),
                                  height: screenWidth * 0.075,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                const String url = 'https://github.com/rush4n';
                                launchURL(url);
                              },
                              icon: FittedBox(
                                child: Image(
                                  image: const AssetImage(
                                      'assets/components/github.png'),
                                  height: screenWidth * 0.075,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
