import 'package:chat_app/core/utils/widgets/style_text.dart';
import 'package:chat_app/feature/storypage/data/model/storypage_model.dart';
import 'package:chat_app/feature/storypage/presentation/view/show_storeis.dart';
import 'package:flutter/material.dart';

class PeapolesStoriesWidget extends StatelessWidget {
  const PeapolesStoriesWidget({super.key, required this.storyPageModel});
  final StoryPageModel storyPageModel;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ShowStoreis.id);
      },
      child: ListTile(
        leading: ClipOval(
          child: Image.asset(
            storyPageModel.imageUrl,
            width:50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          storyPageModel.title,
          style: isDark ? StyleText.personDescWhite : StyleText.personNameBlack
        ),
        subtitle: Text(
          storyPageModel.description,
          style: isDark ? StyleText.personDescWhite : StyleText.personDescBlack
        ),
      ),
    );
  }
}