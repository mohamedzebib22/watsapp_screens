


import 'package:chat_app/feature/chatpage/data/model/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatUpdated extends ChatState {
  final List<MessageModel> messages;

  ChatUpdated(this.messages);
}
