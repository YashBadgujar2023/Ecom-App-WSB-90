import 'dart:developer';

import 'package:e_commerce/Screen/auth/login/Log%20In.dart';
import 'package:e_commerce/Screen/auth/signup/Sign_up.dart';
import 'package:e_commerce/Screen/auth/choice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  late PageController _controller;
  var onboarding_image =[
    {
      "image":"assets/image/onBoarding_image/onboarding_1.png",
      "title":" Welcome to E-commerce!",
      "desc":"  Shop your favorite brands and discover amazing deals. Get started in seconds.",
    },
    {
      "image":"assets/image/onBoarding_image/onboarding_3.png",
      "title":"Shop what you love.",
      "desc":"Tell us a little about yourself to see personalized recommendations and deals. (Skip if you prefer).",
    },
    {
      "image":"assets/image/onBoarding_image/onboarding_2.png",
      "title":" Happy Shopping!",
      "desc":" Explore millions of products and find what you need. We make shopping easy and convenient.",
    },
  ];
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: onboarding_image.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: (){
                                if(index == onboarding_image.length-1){
                                  log("login");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const Log_in()));
                                  getdata(true);
                                }
                                _controller.animateToPage(onboarding_image.length - 1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                              },
                              child: Text(index == onboarding_image.length-1 ? "login" : "skip",style: TextStyle(fontSize: 25,color: Colors.orange))),
                          Icon(Icons.arrow_forward_ios_sharp,color: Colors.orange,size: 15,)
                        ],
                      ),
                      Image.asset(onboarding_image[index]["image"].toString(),height: 300,fit: BoxFit.cover,),
                      SizedBox(
                        height: 20,
                      ),
                      Text(onboarding_image[index]["title"].toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),textAlign:TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      Text(onboarding_image[index]["desc"].toString(),style: TextStyle(fontSize: 18,),textAlign:TextAlign.center),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      if(index == onboarding_image.length-1)
                      {
                        log("Register");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const Sign_up()));
                        getdata(true);
                      }
                      _controller.nextPage(duration: Duration(milliseconds: 500),curve: Curves.ease);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                          child: Text(index == onboarding_image.length-1 ? "Register" : "continue",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500,color: Colors.white ),)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  getdata(bool value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("onboarding", value);
  }
}
