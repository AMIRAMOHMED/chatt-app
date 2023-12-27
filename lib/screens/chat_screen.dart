import 'package:chatt_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  static String id = "chatScreen";

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messages> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Messages.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/live_chat.png",
                    height: 50,
                  ),
                  const Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubble(
                              message: messagesList[index],
                            )
                          : ChatBubbleFreine(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        "id": email
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            messages
                                .add({kCreatedAt: DateTime.now(), "id": email});
                            controller.clear();
                            _controller.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          icon: const Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintText: "send Message",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
              backgroundColor: kWhiteColor,
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
