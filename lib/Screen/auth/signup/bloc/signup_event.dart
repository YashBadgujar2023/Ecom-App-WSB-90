part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}
class signupuserevent extends SignupEvent{
  String f_name;
  String l_name;
  String email;
  String password;
  String phone;
  signupuserevent({required this.f_name,required this.l_name,required this.email,required this.password,required this.phone});
}
