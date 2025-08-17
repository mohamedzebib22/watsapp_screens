import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class ShowStoriesBody extends StatefulWidget {
  const ShowStoriesBody({super.key});

  @override
  State<ShowStoriesBody> createState() => _ShowStoriesBodyState();
}

class _ShowStoriesBodyState extends State<ShowStoriesBody> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        StoryItem.text(
          title: "Welcome to Zytronic!",
          backgroundColor: Colors.blue,
        ),
        StoryItem.pageProviderImage(
          AssetImage("assets/image/1.png"),
          duration: const Duration(seconds: 5),
        ),
        StoryItem.pageProviderImage(
          AssetImage("assets/image/2.png"),
          duration: const Duration(seconds: 5),
        ),
        StoryItem.pageProviderImage(
          AssetImage("assets/image/3.png"),
          duration: const Duration(seconds: 5),
        ),
        StoryItem.pageProviderImage(
          AssetImage("assets/image/4.png"),
          duration: const Duration(seconds: 5),
        ),
      ],
      controller: controller,
      onComplete: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    
  }
}
