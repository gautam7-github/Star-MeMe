import 'dart:async';
import 'dart:typed_data';
import 'package:ionicons/ionicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.yellow,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
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
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: Text(
        'Star Meme',
        style: TextStyle(
          color: Colors.yellow,
          fontFamily: 'Pricedown',
          fontWeight: FontWeight.bold,
          fontSize: 48.0,
        ),
      ),
      image: Image(
        image: AssetImage('assets/icons/splash_icon.png'),
      ),
      photoSize: 64,
      backgroundColor: Colors.black,
      loaderColor: Colors.yellow,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  // list containing all the links to fetch images.
  final List starWarsMemes = [
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/1.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/2.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/3.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/4.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/5.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/6.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/7.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/8.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/9.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/10.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/11.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/12.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/13.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/14.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/15.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/16.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/17.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/18.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/19.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/20.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/21.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/22.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/23.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/24.jpg",
    "https://raw.githubusercontent.com/gautam7-github/assets/main/memes/25.jpg",
  ];
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
          scrollDirection: Axis.vertical,
          itemCount: starWarsMemes.length,
          itemBuilder: (BuildContext context, int index) {
            return smallImage(index);
          },
        ),
      ),
    );
  }

  Widget smallImage(int index) {
    return FullScreenWidget(
      backgroundIsTransparent: true,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Card(
              color: Colors.black,
              shadowColor: Colors.white,
              elevation: 3,
              child: Hero(
                transitionOnUserGestures: true,
                tag: "smallImage$index",
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        child: CachedNetworkImage(
                          imageUrl: starWarsMemes[index],
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Ionicons.logo_electron,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 25)),
                        child: MaterialButton(
                          hoverColor: Colors.blueGrey,
                          elevation: 18,
                          enableFeedback: true,
                          child: Icon(
                            Ionicons.send_outline,
                            color: Colors.white,
                          ),
                          onLongPress: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Share This Meme By Tapping This Icon",
                                ),
                              ),
                            );
                          },
                          onPressed: () async => await _shareimage(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _shareimage(int index) async {
    try {
      print('sharing');
      final ByteData bytes = await rootBundle.load(
        'assets/memes/${index + 1}.jpg',
      );
      await Share.file(
        'Star Meme Number ${index + 1}',
        'meme${index}star.jpg',
        bytes.buffer.asUint8List(),
        'image/jpg',
        text: 'Star Meme',
      );
    } catch (e) {
      print('error: $e');
    }
  }
}
