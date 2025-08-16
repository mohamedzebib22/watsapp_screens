import 'package:chat_app/core/utils/constants/constant.dart';
import 'package:chat_app/core/utils/widgets/custom_text_feild.dart';
import 'package:chat_app/core/utils/widgets/style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatPageWidgetBody extends StatelessWidget {
  const ChatPageWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        buuildCustomAppBar(
          backGroundColor: isDark? Colors.black : Colors.white,
          width: width,
          height: height,
          iconColor: isDark ? Colors.white : Colors.black,
          textStyle: isDark
              ? StyleText.personNameWhite
              : StyleText.personNameBlack,
        ),
        SizedBox(height: height * 0.02),
        buildChatBubble(
          width: width,
          bubbleType: BubbleType.sendBubble,
          backGroundColor: const Color.fromARGB(255, 2, 107, 5),
        ),
        buildChatBubble(
          width: width,
          bubbleType: BubbleType.receiverBubble,
          backGroundColor: const Color.fromARGB(255, 46, 44, 44),
        ),
       
      ],
    );
  }

  Widget buuildCustomAppBar({
    required double width,
    required double height,
    required Color iconColor,
    required TextStyle textStyle,
    required Color backGroundColor,
  }) {
    return Container(
      width: width,
      height: height * 0.1,
      color: backGroundColor,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Row(
        children: [
          Icon(Icons.videocam_outlined, color: iconColor),
          SizedBox(width: width * 0.04),
          Icon(Icons.call, color: iconColor),
          SizedBox(width: width * 0.04),
          Icon(Icons.more_vert_outlined, color: iconColor),

          Spacer(),
          Text('محمد سمير', style: textStyle, overflow: TextOverflow.ellipsis),
          SizedBox(width: width * 0.04),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/image/avatar3.png'),
          ),
        ],
      ),
    );
  }

  Widget buildChatBubble({
    required double width,
    required BubbleType bubbleType,
    required Color backGroundColor,
  }) {
    return ChatBubble(
      clipper: ChatBubbleClipper10(type: bubbleType),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: backGroundColor,
      child: Container(
        constraints: BoxConstraints(maxWidth: width * 0.7),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
