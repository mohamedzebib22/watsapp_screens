import 'package:chat_app/feature/storypage/presentation/widget/show_stories_body.dart';
import 'package:flutter/material.dart';

class ShowStoreis extends StatelessWidget {
  const ShowStoreis({super.key});
  static const String id = 'show_stories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const ShowStoriesBody(),
    );
  }
}