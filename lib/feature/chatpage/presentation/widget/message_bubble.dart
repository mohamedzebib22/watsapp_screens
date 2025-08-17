import 'package:chat_app/feature/chatpage/data/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class MessageBubble extends StatefulWidget {
  final MessageModel message;
  final double width;

  const MessageBubble({super.key, required this.message, required this.width});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward(); 
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: ChatBubble(
        clipper: ChatBubbleClipper10(
          type: widget.message.isSender
              ? BubbleType.sendBubble
              : BubbleType.receiverBubble,
        ),
        alignment: widget.message.isSender
            ? Alignment.topRight
            : Alignment.topLeft,
        margin: const EdgeInsets.only(top: 10),
        backGroundColor: widget.message.isSender
            ? const Color.fromARGB(255, 2, 107, 5)
            : const Color.fromARGB(255, 46, 44, 44),
        child: Container(
          constraints: BoxConstraints(maxWidth: widget.width * 0.7),
          child: Text(
            widget.message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}