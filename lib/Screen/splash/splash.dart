import 'dart:async';

import 'package:e_commerce/Screen/auth/choice.dart';
import 'package:e_commerce/Screen/home/bottom_nav.dart';
import 'package:e_commerce/Screen/home/homescreen.dart';
import 'package:e_commerce/Screen/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      check();
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const onboarding()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: RiveAnimation.asset("assets/riv/new_file.riv"
        )
      ),
    );
  }
  check()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? get = preferences.getBool("onboarding");
    final bool? islogin = preferences.getBool("islogin");
    if(islogin == true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>home()));
    }
    else{
      if (get == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const choice()));
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const onboarding()));
      }
    }
  }
}
