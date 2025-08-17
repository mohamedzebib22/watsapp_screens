
import 'package:chat_app/feature/homepage/presentation/widget/chat_page_body.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body:const ChatPageBody(),
    );
  }

}