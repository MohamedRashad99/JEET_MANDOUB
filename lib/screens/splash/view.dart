import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jeet/screens/welcome/view.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                WelComeHome(),
            ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/splash.png",fit: BoxFit.fitWidth,width:width ,),
          Center(child: Image.asset("assets/images/sLogo.png",width: width*0.5,height: height*0.2,)),
          Padding(
            padding: EdgeInsets.only(top: 160),
            child: Center(child: Text("JEEET", style: TextStyle(fontSize: 26,fontFamily: "dinnextl bold"),)),
          )
        ],
      ),
    );
  }
}
