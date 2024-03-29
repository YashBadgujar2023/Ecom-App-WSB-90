part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class Signuploading extends SignupState {}
class UserCreated extends SignupState {
  String token;
  UserCreated({required this.token});
}
class Userfailure extends SignupState {
  String error;
  Userfailure({required this.error});
}
