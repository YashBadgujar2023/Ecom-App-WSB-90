part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loginlodaing extends LoginState {}
class Loginsccuss extends LoginState {
  String token;
  Loginsccuss({required this.token});
}
class Loginfailure extends LoginState {
  String error;
  Loginfailure({required this.error});
}
