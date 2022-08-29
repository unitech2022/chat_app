part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
//get
class GetUsersStateLoad extends UserState {}
class GetUsersStateSuccess extends UserState {}
class GetUsersStateError extends UserState {
}
