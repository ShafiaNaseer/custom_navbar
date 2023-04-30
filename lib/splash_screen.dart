import 'dart:async';

import 'package:custom_navbar/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage('assets/logo.png'))),
          SizedBox(height: 20,),
          Center(child: Text("Fruit Hub", style: TextStyle(fontSize: 15),)),
          SizedBox(height: 20,),
          Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
        ],
      ),
    );
  }
}
