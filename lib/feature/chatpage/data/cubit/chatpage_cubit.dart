import 'package:bloc/bloc.dart';
import 'package:chat_app/feature/chatpage/data/cubit/chatpage_state.dart';
import 'package:flutter/material.dart';
import '../../data/model/message_model.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  TextEditingController controller = TextEditingController();

  List<MessageModel> messages = [];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = MessageModel(text: text, isSender: true);
    messages.add(message);

    emit(ChatUpdated(List.from(messages))); 
  }

  void receiveMessage(String text) {
    final message = MessageModel(text: text, isSender: false);
    messages.add(message);

    emit(ChatUpdated(List.from(messages)));
  }
}
