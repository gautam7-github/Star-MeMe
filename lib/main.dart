import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      title: 'Star Meme',
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: Home(),
      title: Text(
        'Star Meme',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Pricedown',
          fontWeight: FontWeight.bold,
          fontSize: 48.0,
        ),
      ),
      image: Image(
        image: AssetImage('assets/icons/splash_icon.png'),
        height: 1024,
        width: 1024,
      ),
      backgroundColor: Colors.black,
      loaderColor: Colors.yellow,
    );
  }
}

class Home extends StatelessWidget {
  final List starWarsMemes = [
    "assets/memes/1.jpg",
    "assets/memes/2.jpg",
    "assets/memes/3.jpg",
    "assets/memes/4.jpg",
    "assets/memes/5.jpg",
    "assets/memes/6.jpg",
    "assets/memes/7.jpg",
    "assets/memes/8.jpg",
    "assets/memes/9.jpg",
    "assets/memes/10.jpg",
    "assets/memes/11.jpg",
    "assets/memes/12.jpg",
    "assets/memes/13.jpg",
    "assets/memes/14.jpg",
    "assets/memes/15.jpg",
    "assets/memes/16.jpg",
    "assets/memes/17.jpg",
    "assets/memes/18.jpg",
    "assets/memes/19.jpg",
    "assets/memes/20.jpg",
    "assets/memes/21.jpg",
    "assets/memes/22.jpg",
    "assets/memes/23.jpg",
    "assets/memes/24.jpg",
    "assets/memes/25.jpg",
  ];
  // 587D71 ED6A5A
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "Star Meme",
          style: TextStyle(
            fontFamily: 'PriceDown',
            fontSize: 32,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage('assets/icons/appBar_icon.png'),
            color: Colors.white,
            height: 64,
            width: 64,
            fit: BoxFit.scaleDown,
          ),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: starWarsMemes.length,
          itemBuilder: (BuildContext context, int index) {
            return smallImage(index);
          },
        ),
      ),
    );
  }

  Widget smallImage(int index) => FullScreenWidget(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Hero(
              transitionOnUserGestures: true,
              tag: "smallImage$index",
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.black,
                  child: Image.asset(
                    starWarsMemes[index],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
