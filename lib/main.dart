import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:full_screen_image/full_screen_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          title: Text(
            "MeMe HeHe",
            style: TextStyle(
              fontFamily: 'PriceDown',
              fontSize: 32,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('images/icons/appBar_icon.png'),
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
      ),
    );
  }

  Widget smallImage(int index) => FullScreenWidget(
        child: Center(
          child: Hero(
            transitionOnUserGestures: true,
            tag: "smallImage",
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Image.asset(
                  starWarsMemes[index],
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      );
}
