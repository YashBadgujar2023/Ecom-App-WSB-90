import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<signupuserevent>((event, emit) async{
      emit(Signuploading());
      var response = await http.post(
          Uri.parse("https://www.infusevalue.live/api/v1/auth/register"),
          body: jsonEncode({
            "f_name": event.f_name,
            "l_name": event.l_name,
            "email": event.email,
            "phone": event.phone,
            "password": event.password
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
        emit(UserCreated(token: token));
      }
      else {
         emit(Userfailure(error: response.statusCode.toString()));
      }
    });
  }
}
