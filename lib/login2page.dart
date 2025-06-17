import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smartwheels/constants/colorconstants/colorconstants.dart';

import 'main.dart';
import 'otpPage.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN2",
          style: TextStyle(
              color: ColorConstant.blackColor
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height*0.5,
              width: width*1,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/baground img.webp",
                ),
                   fit: BoxFit.fill
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IntlPhoneField(
                  decoration: InputDecoration(
                      labelText: "phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03)
                      )
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(),)),
                  child: Container(
                    height: height*0.06,
                    width: width*0.5,
                    decoration: BoxDecoration(
                        color: ColorConstant.blueColor,
                        borderRadius: BorderRadius.circular(width*0.07),
                        border: Border.all(
                          color: ColorConstant.blackColor,
                        )
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(),)),
                      child: Center(
                        child: Text("Send OTP",
                          style:TextStyle(
                              color: ColorConstant.blackColor,
                              fontWeight: FontWeight.w700
                          ) ,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign in with "),
                    Text(" Another Method ?",
                      style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w900
                      ),
                    )
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}

