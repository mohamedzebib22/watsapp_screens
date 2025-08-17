import 'package:chat_app/core/utils/constants/constant.dart';
import 'package:chat_app/core/utils/widgets/style_text.dart';
import 'package:chat_app/feature/storypage/data/model/storypage_model.dart';
import 'package:chat_app/feature/storypage/presentation/widget/peapoles_stories_widget.dart';
import 'package:flutter/material.dart';

class StoryPageBody extends StatelessWidget {
  const StoryPageBody({super.key});

  @override
  Widget build(BuildContext context) {  
    List<StoryPageModel> storyList = [
      StoryPageModel(title: 'محمد سمير', description: '3.05 ص', imageUrl: 'assets/image/avatar3.png'),
      StoryPageModel(title: 'ساره احمد', description: '3.05 ص', imageUrl: 'assets/image/avatar1.jpg'),
      StoryPageModel(title: 'ريم صابر ', description: '3.05 ص', imageUrl: 'assets/image/avatar3.png'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
      StoryPageModel(title: 'جنا محمود ', description: '3.05 ص', imageUrl: 'assets/image/avatar2.jpg'),
    ];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
      child: Column(children: [
        SizedBox(height: height*0.02,),
        buildStoryText(isDark),
        buildMyStatusWidget( isDark: isDark, width: width),
        SizedBox(height: height*0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
  
          Text(Constant.newStories, style: isDark ? StyleText.newStory12White : StyleText.newStory12Black),
           SizedBox(width: width * 0.04),
        ],),
        SizedBox(height: height*0.02,),
        Expanded(
          child:Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
             
              itemCount: storyList.length,
              itemBuilder: (context ,  index){
              return PeapolesStoriesWidget(storyPageModel: storyList[index],);
              
            }),
          ),
        )
      ],
      ),
    ); 
  }

  Row buildStoryText(bool isDark) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(Constant.story,style: isDark ? StyleText.defualtTextWhite : StyleText.defualtTextWhite,),
        ],

      );
  }
}

Widget buildMyStatusWidget({
  
  required bool isDark,
  required double width,
}) {
  return Directionality(
    
    textDirection: TextDirection.rtl,
    child: Row(
      children: [
        SizedBox(width: width * 0.04),
        Stack(
          children: [
            ClipOval(
              child:  Image.asset(
                "assets/image/avatar2.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            
           
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? Colors.black : Colors.white,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
         SizedBox(width: width*0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constant.addStory,
              style: isDark
                  ? StyleText.personNameWhite
                  : StyleText.personNameBlack,
            ),
            const SizedBox(height: 4),
            Text(
             Constant.endStory,
              style: isDark
                  ? StyleText.personDescWhite
                  : StyleText.personDescBlack,
            ),
          ],
        ),
      ],
    ),
  );
}
