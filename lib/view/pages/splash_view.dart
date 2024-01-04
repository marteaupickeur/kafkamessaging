import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // this function called on init will call
  // after a delay the agenceRoute
  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(
        duration, () => Navigator.pushReplacementNamed(context, '/register'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      width: 70,
                      height: 70,
                      image: AssetImage("images/sms.png"),
                    ),
                  ),
                ),
                const Text(style: TextStyle(fontSize: 20), "Kafka messaging")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
