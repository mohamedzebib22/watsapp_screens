import 'package:chat_app/core/utils/constants/constant.dart';
import 'package:chat_app/core/utils/widgets/custom_text_feild.dart';
import 'package:chat_app/feature/chatpage/data/cubit/chatpage_cubit.dart';
import 'package:chat_app/feature/chatpage/presentation/widget/chatpage_widget.dart';
import 'package:chat_app/feature/homepage/data/model/prson_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key, required this.personInfo});
  static String id = 'ChatPageView';
  final PersonInfoModel personInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Builder(
        builder: (context) {
          final ChatCubit viewModel = BlocProvider.of<ChatCubit>(context);
          final double width = MediaQuery.of(context).size.width;
          final isDark = Theme.of(context).brightness == Brightness.dark;

          return SafeArea(
            child: Scaffold(
              backgroundColor: isDark ? Colors.black : const Color.fromARGB(255, 211, 196, 196),
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
                    isDark
                        ? const Color.fromARGB(255, 78, 78, 78)
                        : const Color.fromARGB(179, 218, 215, 215),
                    viewModel.controller,
                    context,
                  ),
                ),
              ),
              body: ChatPageWidgetBody(personInfo: personInfo),
            ),
          );
        },
      ),
    );
  }
}

Row buildTextFeildToSendMessage(
  double width,
  Color hintColor,
  Color fillColor,
  TextEditingController controller,
  BuildContext context,
) {
  final chatCubit = context.read<ChatCubit>();

  return Row(
    children: [
      ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          if (value.text.isEmpty) {
            return CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 13, 161, 18),
              child: Icon(Icons.mic, color: Colors.black, size: 24),
            );
          } else {
            return CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 13, 161, 18),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.black, size: 20),
                onPressed: () async {
                  chatCubit.sendMessage(controller.text);
                  controller.clear();
                },
              ),
            );
          }
        },
      ),
      SizedBox(width: width * 0.06),
      Expanded(
        child: CustomTextFeild(
          controller: controller,
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
