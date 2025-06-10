import 'package:flutter/material.dart';

import 'constants/colorconstants/colorconstants.dart';
import 'loginpage.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(
        seconds: 5
    )).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginpagePage(),)), );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assetName"))
          ],

        ),
    )
    );
  }
}
