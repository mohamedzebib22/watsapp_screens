import 'package:chat_app/core/utils/constants/constant.dart';
import 'package:chat_app/core/utils/widgets/custom_text_feild.dart';
import 'package:chat_app/feature/chatpage/presentation/widget/chatpage_widget.dart';
import 'package:flutter/material.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Colors.transparent, 
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: MediaQuery.of(context).viewInsets.bottom + 8,
            ),
            child: buildTextFeildToSendMessage(
              width,
              isDark ? Colors.white : Colors.black,
              isDark ? const Color.fromARGB(255, 78, 78, 78) : const Color.fromARGB(179, 218, 215, 215),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isDark
                    ? 'assets/image/darkbackground.jpg'
                    : 'assets/image/lightbackground.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: const ChatPageWidgetBody(),
        ),
      ),
    );
  }
}

Row buildTextFeildToSendMessage(double width, Color hintColor,Color fillColor) {
  return Row(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: const Color.fromARGB(255, 13, 161, 18),
        child: Icon(Icons.mic, color: Colors.black, size: 24),
      ),
      SizedBox(width: width * 0.06),
      Expanded(
        child: CustomTextFeild(
          isFill: true,
          fillColor: fillColor,
          textStyleColor: Colors.white,
          hintText: Constant.send,
          hintColor: hintColor,
          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: width * 0.03),
              Icon(Icons.linked_camera_outlined),
              SizedBox(width: width * 0.04),
              Icon(Icons.attach_file_outlined),
            ],
          ),
          sufix: Icon(Icons.emoji_emotions_outlined),
        ),
      ),
    ],
  );
}
