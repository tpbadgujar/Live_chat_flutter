import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:ive_chat_flutter/main.dart';
import 'package:ive_chat_flutter/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 1500),
        () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Home()))
            });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.home,
          color: Colors.black,
        ),
        title: const Text(
          'Flutter Chat',
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            top: mediaQuery.height * .15,
            width: mediaQuery.width * .5,
            left: mediaQuery.width * .25,
            child: Image.asset('images/chat.png'),
          ),
          Positioned(
            bottom: mediaQuery.height * .15,
            width: mediaQuery.width * .5,
            right: mediaQuery.width * .25,
            child: const Text(
              'Made in Love With India 💖',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
