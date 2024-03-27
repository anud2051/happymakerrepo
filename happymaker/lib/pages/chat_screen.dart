import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:happymaker/constants/constants.dart';
import 'package:happymaker/services/assets_manager.dart';
import 'package:happymaker/widgets/chat_widget.dart';
import 'package:happymaker/widgets/textWidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          title: Container(
            padding: const EdgeInsets.all(25),
            child: Image.asset(AssetsManager.logoandnameImage),
          )),
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatMessages[index]["msg"].toString(),
                    chatIndex:
                        int.parse(chatMessages[index]["chatIndex"].toString()),
                  );
                }),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Color.fromARGB(255, 234, 239, 83),
              size: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: textEditingController,
                      onSubmitted: (value) {
                        // TODO send message
                      },
                      decoration: const InputDecoration.collapsed(
                          hintText: "How can i help you?",
                          hintStyle: TextStyle(color: Colors.black)),
                    )),
                    IconButton(
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Row(
                                children: [
                                  Flexible(
                                      child: TextWidget(
                                    label: "Chosen model:",
                                    fontSize: 16,
                                  ))
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.send),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )
          ]
        ],
      )),
    );
  }
}
