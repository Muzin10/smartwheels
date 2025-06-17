
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwheels/splashscreen.dart';

import 'customwidgetss/bgcolor.dart';
import 'homepage.dart';
late double height;
late double width;
void main()  {

  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (BuildContext context) {
          return TestApp();
        },));
}
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
            textTheme: GoogleFonts.poppinsTextTheme(),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent
            ),

        ),
        debugShowCheckedModeBanner: false,
        home:GradientBackground(
          child:  SplashScreen(),
        ),

      ),
    );
  }
}