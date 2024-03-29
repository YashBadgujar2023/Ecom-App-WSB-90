part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class loginuser extends LoginEvent{
  String email;
  String password;
  loginuser({required this.email,required this.password});
}
