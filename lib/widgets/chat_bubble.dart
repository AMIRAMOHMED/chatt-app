import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding:
              const EdgeInsets.only(left: 15, top: 32, bottom: 32, right: 32),
          decoration: const BoxDecoration(
              color: kPrimaryDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

class ChatBubbleFreine extends StatelessWidget {
  const ChatBubbleFreine({super.key, required this.message});
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding:
              const EdgeInsets.only(left: 15, top: 32, bottom: 32, right: 32),
          decoration: const BoxDecoration(
              color: kPrimaryHighContrast,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
