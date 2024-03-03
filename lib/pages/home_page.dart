import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/title_art.dart';
import '../pages/how_to_play_page.dart';
import '../components/image_button.dart';
import '../pages/input_page.dart';
import '../pages/dev_info.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(screenWidth/40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenWidth/20,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // title
                  TitleArt(height: screenWidth/8.22,),
                  const SizedBox(
                    height: 60,
                  ),
                  ImageButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InputPage()));
                    },
                    imagePath1: 'assets/components/play.png',
                    height: screenWidth/4,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ImageButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HowToPage()));
                        },
                        imagePath1: 'assets/components/help.png',
                        height: screenWidth/12,
                      ),
                      const SizedBox(height: 10,),
                      ImageButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DevInfoPage()));
                        },
                        imagePath1: 'assets/components/about.png',
                        height: screenWidth/12,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
