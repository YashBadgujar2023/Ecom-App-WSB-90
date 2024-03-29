import 'package:e_commerce/Screen/auth/login/Log%20In.dart';
import 'package:e_commerce/Screen/auth/signup/Sign_up.dart';
import 'package:flutter/material.dart';

class choice extends StatefulWidget {
  const choice({super.key});

  @override
  State<choice> createState() => _choiceState();
}

class _choiceState extends State<choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/image/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),

              Column(
                children: [
                  Text("Start Your Shopping Journey Now",style: TextStyle(fontSize: 35,color: Colors.white),textAlign: TextAlign.center),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>const Log_in()));
                      },
                      child: Text("Login",style: TextStyle(color: Colors.red,fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                            color: Colors.red,
                            width: 1
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>const Sign_up()));
                      },
                      child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
