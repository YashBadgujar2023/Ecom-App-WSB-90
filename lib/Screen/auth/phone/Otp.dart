import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    child: Text("OTP",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900)
                    )
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Enter the One Time Password(OTP) Send to your SMS to verfiy",),
                ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: otpcontroller,
                    keyboardType:TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: TextStyle(fontSize: 15,color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter the OTP",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      prefixIcon: Icon(Icons.password),
                      fillColor: Colors.grey.shade200,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none
                      ),
                    ),
                  )
              ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Resend Otp",style: TextStyle(color: Colors.blue),),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("Verify",style: TextStyle(color: Colors.white,fontSize: 18),),
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
}
