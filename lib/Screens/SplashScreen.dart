import 'package:flutter/material.dart';
// import 'package:spiceapp/Screens/OnboardingScreen.dart';

import 'Dashboard.dart';
import 'OnboardingScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          child: Image.asset('images/background.png',alignment: Alignment.center),
        ),
      ),
    );
  }
}
