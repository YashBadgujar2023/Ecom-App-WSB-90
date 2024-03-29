import 'package:e_commerce/Screen/auth/phone/Otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Phone_auth extends StatefulWidget {
  const Phone_auth({super.key});

  @override
  State<Phone_auth> createState() => _Phone_authState();
}

class _Phone_authState extends State<Phone_auth> {
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phone Verfication",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900)
                    )
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Phone verfication for Verify its you.A 6 digit OTP will be sent via SMS to verify your mobile number.",),
                ),
                CustomTextfield(phonecontroller,"Enter the Mobile Number", Icons.phone_android),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Otp()));
                    },
                    child: Text("Send OTP",style: TextStyle(color: Colors.white,fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  CustomTextfield(TextEditingController controller, String hint,IconData icon) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: controller,
          keyboardType:TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
          style: TextStyle(fontSize: 15,color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
            prefixIcon: Icon(icon),
            fillColor: Colors.grey.shade200,
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            ),
          ),
        )
    );
  }
}
