import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Chat/Components/header_chat.dart';
import 'package:nearme_app/Features/Notifications/Components/date_label.dart';
import 'package:nearme_app/Features/Chat/Components/chat_input_field.dart';
import 'package:nearme_app/Features/Chat/Components/message_bubble.dart';
import 'package:nearme_app/core/constants.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({super.key});
  static String groupChatKey = '/GroupChat';
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": _messageController.text,
          "time": "${DateTime.now().hour}:${DateTime.now().minute}",
        });
        _messageController.clear();
      });
    }
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          HeaderChat(
            onClearChatPressed: _clearChat,
            title: 'Radwa',
            backArrow: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor1,
              size: 25,
            ),
            showCircleAvatar: true,
          ),
          const DateLabel(dateText: 'Yesterday'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  message: message["message"]!,
                  time: message["time"]!,
                );
              },
            ),
          ),
          ChatInputField(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
