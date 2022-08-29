part of 'message_cubit.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}


//get
class GetMessagesStateLoad extends MessageState {}
class GetMessagesStateSuccess extends MessageState {}
class GetMessagesStateError extends MessageState {}


//add
class AddMessagesStateLoad extends MessageState {}
class AddMessagesStateSuccess extends MessageState {}
class AddMessagesStateError extends MessageState {}


// state screen
class ChangeStatePage extends MessageState {}

//upload image
class UploadImageLoad extends MessageState {}
class UploadImageSuccess extends MessageState {}
class UploadImageError extends MessageState {}
