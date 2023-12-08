import 'dart:async';
import 'package:flutter/material.dart';
import 'Authenticationn/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      Navigator.push(context,
          MaterialPageRoute(builder: (c) => const AuthenticationScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(

        body: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
          child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: size.height*0.15),
                SizedBox(
                  height:size.height*0.5,
                  child: Stack(
                    children: [
                      Image.asset("images/DiuFoodHubLogo_1.png",height:size.height*0.35,width: 300),
                      Positioned(
                        top:size.height*0.2,
                        child: Image.asset("images/SellerLogo.png",height:size.height*0.35,width: 300),
                      )
                    ],
                  ),
                ),
                SizedBox(height:size.height*0.2),
                const Text('Sell Food Online',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize:30,
                        fontFamily: "Signatra",
                        letterSpacing: 3))
              ],
            ),
          ),
        ));
  }
}
