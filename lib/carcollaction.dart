import 'package:flutter/material.dart';
import 'package:smartwheels/constants/colorconstants/colorconstants.dart';

import 'main.dart';

class CarCollactionPage extends StatefulWidget {
  const CarCollactionPage({super.key});

  @override
  State<CarCollactionPage> createState() => _CarCollactionPageState();
}

class _CarCollactionPageState extends State<CarCollactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       appBar: AppBar(
         title: Text("CAR COLLACTION",
         style: TextStyle(
           color: ColorConstant.whiteColor
         ),),
         centerTitle: true,
       ),
      body: Padding(
        padding:EdgeInsets.all(width*0.03),
        child:Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height*0.4,
                        width: width*0.8,
                        decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/blackcar.jpg")),
                            color: ColorConstant.blackColor,
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                        child: Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text("MCLAREN GT",

                            style: TextStyle(

                              color: ColorConstant.whiteColor,
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:1,
                    mainAxisSpacing: width*0.03,
                    crossAxisSpacing: width*0.03,
                    childAspectRatio: 1
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
