import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happymaker/constants/constants.dart';
import 'package:happymaker/services/assets_manager.dart';
import 'package:happymaker/widgets/textWidget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userlogo
                      : AssetsManager.logoImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.thumb_down_alt_outlined,
                              color: Colors.white)
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
