// import 'package:flutter/material.dart';
// import 'package:nearme_app/Features/Notifications/Components/date_label.dart';
// import 'package:nearme_app/core/constants.dart';

// import '../components/chat_input_field.dart';
// import '../components/header_chat.dart';
// import '../components/message_bubble.dart';

// class GroupChat extends StatefulWidget {
//   const GroupChat({super.key});
//   static String groupChatKey = '/GroupChat';
//   @override
//   _GroupChatState createState() => _GroupChatState();
// }

// class _GroupChatState extends State<GroupChat> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   void _sendMessage() {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _messages.add({
//           "message": _messageController.text,
//           "time": "${DateTime.now().hour}:${DateTime.now().minute}",
//         });
//         _messageController.clear();
//       });
//     }
//   }

//   void _clearChat() {
//     setState(() {
//       _messages.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       body: Column(
//         children: [
//           HeaderChat(
//             onClearChatPressed: _clearChat,
//             title: 'Radwa',
//             backArrow: const Icon(
//               Icons.arrow_back_ios,
//               color: kPrimaryColor1,
//               size: 25,
//             ),
//             showCircleAvatar: true,
//           ),
//           const DateLabel(dateText: 'Yesterday'),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return MessageBubble(
//                   message: message["message"]!,
//                   time: message["time"]!,
//                 );
//               },
//             ),
//           ),
//           ChatInputField(
//             controller: _messageController,
//             onSend: _sendMessage,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nearme_app/Features/Notifications/Components/date_label.dart';
import 'package:nearme_app/core/constants.dart';

import '../components/chat_input_field.dart';
import '../components/header_chat.dart';
import '../components/message_bubble.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({super.key});
  static String groupChatKey = '/GroupChat';
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages(); // تحميل الرسائل عند بدء التشغيل
  }

  // تحميل الرسائل المحفوظة
  void _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedMessages = prefs.getStringList('group_chat_messages');
    if (savedMessages != null) {
      setState(() {
        _messages = savedMessages.map((message) {
          List<String> parts = message.split('|');
          return {"message": parts[0], "time": parts[1]};
        }).toList();
      });
    }
  }

  // حفظ الرسائل
  void _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messagesToSave = _messages.map((message) {
      return "${message["message"]}|${message["time"]}";
    }).toList();
    prefs.setStringList('group_chat_messages', messagesToSave);
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": _messageController.text,
          "time": "${DateTime.now().hour}:${DateTime.now().minute}",
        });
        _messageController.clear();
        _saveMessages(); // حفظ الرسائل بعد الإضافة
      });
    }
  }

  void _clearChat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('group_chat_messages'); // حذف الرسائل المحفوظة
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
