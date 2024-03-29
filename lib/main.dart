import 'package:e_commerce/Screen/auth/login/bloc/login_bloc.dart';
import 'package:e_commerce/Screen/auth/signup/bloc/signup_bloc.dart';
import 'package:e_commerce/Screen/onboarding/onboarding.dart';
import 'package:e_commerce/Screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SignupBloc()),
        BlocProvider(create: (_)=>LoginBloc()),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          home: const splash(),
        ),
      ),
    );
  }
}
