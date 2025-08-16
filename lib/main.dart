import 'package:chat_app/core/models/theme_data.dart';
import 'package:chat_app/feature/homepage/presentation/view/chat_page.dart';
import 'package:chat_app/feature/homepage/presentation/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: AppTheme.ligtTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: const HomePage(),
    );
  }
}