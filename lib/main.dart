import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:full_screen_image/full_screen_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List starWarsMemes = [
    "images/memes/1.jpg",
    "images/memes/2.jpg",
    "images/memes/3.jpg",
    "images/memes/4.jpg",
    "images/memes/5.jpg",
    "images/memes/6.jpg",
    "images/memes/7.jpg",
    "images/memes/8.jpg",
    "images/memes/9.jpg",
    "images/memes/10.jpg",
    "images/memes/11.jpg",
    "images/memes/12.jpg",
    "images/memes/13.jpg",
    "images/memes/14.jpg",
    "images/memes/15.jpg",
    "images/memes/16.jpg",
    "images/memes/17.jpg",
    "images/memes/18.jpg",
    "images/memes/19.jpg",
    "images/memes/20.jpg",
    "images/memes/21.jpg",
    "images/memes/22.jpg",
    "images/memes/23.jpg",
    "images/memes/24.jpg",
    "images/memes/25.jpg",
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
        body: ListView.builder(
          itemCount: starWarsMemes.length,
          itemBuilder: (BuildContext context, int index) {
            return smallImage(index);
          },
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
