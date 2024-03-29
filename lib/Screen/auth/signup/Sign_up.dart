import 'dart:developer';

import 'package:e_commerce/Screen/auth/login/Log%20In.dart';
import 'package:e_commerce/Screen/home/bottom_nav.dart';
import 'package:e_commerce/Screen/widget/Uihelper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bloc/signup_bloc.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passworcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
 /* auth(String f_name ,String l_name,String email,String password,String phone)async{
    if(f_name == "" && l_name == "" && email == "" && password == "" && phone == ""){
      Uihelper.CustomAlertBox(name: "Error", context: context,content: "Enter the requried field");
    }
    else{
      try {
        var response = await http.post(
            Uri.parse("https://www.infusevalue.live/api/v1/auth/register"),
            body: jsonEncode({
              "f_name": f_name,
              "l_name": l_name,
              "email": email,
              "phone": phone,
              "password": password
            }), headers: {
          'Content-Type': 'application/json'
        });
        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);

          String token = data["token"];
          final SharedPreferences preferences = await SharedPreferences
              .getInstance();
          preferences.setString("acess_token", token);
          preferences.setBool("islogin", true);
          log(token);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const home()));
        } else {
          Uihelper.CustomAlertBox(name: response.statusCode.toString(), context: context,content: "Failed to Create Account");
        }
      }
      catch(ex){
        log("Error : :");
      }
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<SignupBloc,SignupState>(
        listener: (context, state) {
          if(state is UserCreated)
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>home()));
            }
          else if(state is Userfailure)
            {
              Uihelper.CustomAlertBox(name: state.error, context: context,content: "Unexcepted Error");
            }
        },
        builder: (context, state) {
          if(state is Signuploading)
          {
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          else if(state is Userfailure)
          {
            return Uihelper.CustomAlertBox(name: state.error, context: context,content: "Unexcepted Error");
          }
          else{
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
                           child: Text("Sign Up",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900)
                           )
                       ),
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Text("Create an account so you can order your favorite products easily  and quickly",),
                       ),
                       SizedBox(height: 15,),
                       Row(
                         children: [
                           Expanded(child:CustomTextfield(firstnamecontroller, "Firstname"), ),
                           SizedBox(width: 10,),
                           Expanded(child:CustomTextfield(lastnamecontroller, "Lastname"), ),
                         ],
                       ),
                       CustomTextfield(emailcontroller, "Email"),
                       CustomTextfield(passworcontroller, "Password"),
                       CustomTextfield(phonecontroller, "Phone"),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                         width: double.infinity,
                         child: ElevatedButton(
                           onPressed: () {
                             var emailvalid = EmailValidator.validate(emailcontroller.text.toString());
                             String fname = firstnamecontroller.text.toString();
                             String lname = lastnamecontroller.text.toString();
                             String email = emailcontroller.text.toString();
                             String password = passworcontroller.text.toString();
                             String phone = phonecontroller.text.toString();
                             if(fname == "" && lname == "" && email == "" && password == "" && phone == ""){
                               Uihelper.CustomAlertBox(name: "Error", context: context,content: "Enter the requried field");
                             }
                             else if(emailvalid)
                               {
                             context.read<SignupBloc>().add(signupuserevent(f_name: firstnamecontroller.text.toString(), l_name: lastnamecontroller.text.toString(), email: emailcontroller.text.toString(), password: passworcontroller.text.toString(), phone: phonecontroller.text.toString()));
                               }
                             else{
                               Uihelper.CustomAlertBox(name: "Error", context: context,content: "Enter the Correct detail");
                             }
                           },
                           child: Text("Register Now",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                           Text("Already Have An Account ?"),
                           SizedBox(width:5,),
                           GestureDetector(
                               onTap: (){
                                 log("Log In");
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const Log_in()));
                               },
                               child: Text("Log In",style: TextStyle(color: Colors.blue),
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
