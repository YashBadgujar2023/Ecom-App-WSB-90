import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<loginuser>((event, emit) async{
      emit(Loginlodaing());
      var response = await http.post(
          Uri.parse("https://www.infusevalue.live/api/v1/auth/login"),
          body: jsonEncode({"email": event.email, "password": event.password}),
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
        emit(Loginsccuss(token: token));
      }
      else {
        emit(Loginfailure(error: response.statusCode.toString()));
      }
    });
  }
}
