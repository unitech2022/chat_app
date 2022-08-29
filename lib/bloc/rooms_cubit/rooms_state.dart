part of 'rooms_cubit.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}


//get
class GetRoomsStateLoad extends RoomsState {}
class GetRoomsStateSuccess extends RoomsState {}
class GetRoomsStateError extends RoomsState {
}


// //Login
// class LoginAuthStateLoad extends RoomsState {}
// class LoginAuthStateSuccess extends RoomsState {
//   final UserResponse userResponse;
//
//   LoginAuthStateSuccess(this.userResponse);
// }
// class LoginAuthStateError extends RoomsState {}
//
//
//
// //Register
// class RegisterAuthStateLoad extends AuthState {}
// class RegisterAuthStateSuccess extends AuthState {
//
//   final String code,userName;
//
//   RegisterAuthStateSuccess({required this.code, required this.userName});
// }
// class RegisterAuthStateError extends AuthState {}
