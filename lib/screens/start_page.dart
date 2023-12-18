import 'dart:ui';
import 'package:autocid/components/reusable_widgets.dart';
import 'package:autocid/screens/login_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  static const page = '/home';
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0b984a),
            Color(0xFF0daa53),
            Color(0xFF0ec35e),
            Color(0xff1c3326),
            Color(0xff020303),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'cargo',
            child: Container(
              margin: EdgeInsets.only(top: 200),
              child: Image.asset(
                'assets/carpin.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              children: [
                Text('Autonomous',
                    style: TextStyle(
                        fontSize: 60,
                        letterSpacing: 2,
                        fontFamily: 'oswald',
                        height: 0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text('EV Charge Station ',
                    style: TextStyle(
                        fontSize: 40,
                        letterSpacing: 3,
                        fontFamily: 'oswald',
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(
                  'Our real-time charging stream, and access flexibily will make you happy.',
                  style: TextStyle(color: Colors.white60, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: 'Get Started!',
                    width: 500,
                    maxHeight: 60,
                    color: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
