import 'package:flutter/material.dart';
import 'customwidgetss/textwidget.dart';
import 'login2page.dart';
import 'otpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Container(
            padding:  EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextSW(
                    text: "Sign up",
                  ),
                   SizedBox(height: 10),
                   Text(
                    "If you already have an account register\nYou can ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add login navigation logic here
                    },
                    child:  InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberPage(),)),

                      child: Text(
                        "Login here !",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 20),
                  _buildTextField("First Name"),
                   SizedBox(height: 10),
                  _buildTextField("Last Name"),
                   SizedBox(height: 10),
                  _buildTextField("Email"),
                   SizedBox(height: 10),
                  _buildPhoneField(),
                   SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:  EdgeInsets.symmetric(
                          horizontal: 80, vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(),));
                    },
                    child:  Text("Send OTP",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor:  Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding:  EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

   Widget _buildPhoneField() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("+91", style: TextStyle(fontSize: 16)),
        ),
        prefixIconConstraints:  BoxConstraints(minWidth: 60),
        hintText: "Phone Number*",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding:  EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
