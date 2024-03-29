import 'dart:developer';

import 'package:e_commerce/Screen/auth/login/bloc/login_bloc.dart';
import 'package:e_commerce/Screen/auth/phone/phone.dart';
import 'package:e_commerce/Screen/home/bottom_nav.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widget/Uihelper.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passworcontroller = TextEditingController();
  /*auth(String email,String password)async{
      var response = await http.post(
          Uri.parse("https://www.infusevalue.live/api/v1/auth/login"),
          body: jsonEncode({"email": email, "password": password}),
          headers: {"Content-Type": 'application/json'});
      if(response.statusCode == 200)
        {
          Map<String,dynamic> data = jsonDecode(response.body);
          String token = data["token"];
          final SharedPreferences preferences = await SharedPreferences
              .getInstance();
          preferences.setString("acess_token", token);
          preferences.setBool("islogin", true);
          log(token);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const home()));
        }
      else {
        Uihelper.CustomAlertBox(name: response.statusCode.toString(), context: context,content: "Failed to Create Account");
      }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is Loginsccuss){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>home()));
          }
          else if(state is Loginfailure)
            {
              Uihelper.CustomAlertBox(name: state.error, context: context,content: "Unexepted error");
            }
        },
        builder: (context, state) {
          if(state is Loginlodaing)
            {
              return Center(child: CircularProgressIndicator.adaptive(),);
            }
          else if(state is Loginfailure)
            {
              return Center(child: Text(state.error),);
            }
          else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Welcome Back",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900)
                            )
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sign in to your account.",),
                        ),
                        SizedBox(height: 15,),
                        CustomTextfield(emailcontroller, "Email"),
                        CustomTextfield(passworcontroller, "Password"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  log("Forgot Password");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Phone_auth()));
                                },
                                child: Text("Forgot Password?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              log("Login");
                              var emailvalid = EmailValidator.validate(emailcontroller.text.toString());
                              if(emailcontroller.text.toString() == "" && passworcontroller.text.toString() == ""){
                                Uihelper.CustomAlertBox(name: "Error", context: context,content: "Enter the requried field");
                              }
                              else if(emailvalid)
                              {
                                context.read<LoginBloc>()..add(loginuser(email: emailcontroller.text.toString(), password: passworcontroller.text.toString()));
                              }
                              else{
                                Uihelper.CustomAlertBox(name: "Error", context: context,content: "Enter the Correct detail");
                              }
                            },
                            child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )
                            ),
                          ),
                        ),
                        Customdivider("or Continue with"),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                log("google");
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.google,
                                size: 30,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                log("Facebook");
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not A Member?"),
                            SizedBox(width:5,),
                            GestureDetector(
                                onTap: (){
                                  log("Log In");
                                },
                                child: Text("Join Now",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      )
    );
  }
  CustomTextfield(TextEditingController controller, String hint) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 15,color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.grey.shade200,
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            ),
          ),
        )
    );
  }
  Customdivider(String name) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            indent: 5,
            endIndent: 10,
            color: Colors.black,
          ),
        ),
        Text(name),
        Expanded(
          child: Divider(
            thickness: 0.5,
            indent: 10,
            endIndent: 5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
