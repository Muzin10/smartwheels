import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'constants/colorconstants/colorconstants.dart';
import 'homepage.dart';
import 'main.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}
class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP",
          style: TextStyle(
              color: ColorConstant.greenColor
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height*0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("OTP has been sent to "),
                      Text("*****634",
                        style: TextStyle(
                            color: ColorConstant. whiteColor
                        ),
                      ),
                    ],
                  ),
                  Pinput(

                  ),
                  InkWell(
                    onTap:() =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomepagePage(),)),

                    child: Container(
                      height: height*0.06,
                      width: width*0.5,
                      decoration: BoxDecoration(
                          color: ColorConstant.redColor,
                          borderRadius: BorderRadius.circular(width*0.07),
                          border: Border.all(
                            color: ColorConstant.greenColor,
                          )
                      ),
                      child: Center(
                        child: Text("Verify",
                          style:TextStyle(
                              color: ColorConstant.redColor,
                              fontWeight: FontWeight.w700
                          ) ,),
                      ),

                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Haven't got the confirmation code yet ? ",
                            style: TextStyle(
                                fontSize: width*0.035
                            ),
                          ),

                          Text("Resend",
                            style: TextStyle(
                              color: ColorConstant.redColor,
                              fontWeight: FontWeight.w700,
                            ),)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text("Try Another Method?")
              ],
            )
          ],
        ),
      ),
    );
  }
}



