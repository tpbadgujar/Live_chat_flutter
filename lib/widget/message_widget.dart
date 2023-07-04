import 'package:flutter/material.dart';
import 'package:ive_chat_flutter/main.dart';
import 'package:ive_chat_flutter/message_model.dart';

class MessageCard extends StatefulWidget {
  @override
  State<MessageCard> createState() => _MessageCardState();

  final MessageModel message;

  const MessageCard(this.message, {super.key});
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return widget.message.fromMe
        ? _fromMe(widget.message)
        : _fromAnother(widget.message);
  }

  Widget _fromMe(MessageModel message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(mediaQuery.width * .04),
          decoration: BoxDecoration(
            color: const Color.fromARGB(225, 221, 245, 255),
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: mediaQuery.width * .04,
              vertical: mediaQuery.height * .01),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }

  Widget _fromAnother(MessageModel message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(mediaQuery.width * .04),
          decoration: BoxDecoration(
            color: const Color.fromARGB(225, 200, 253, 184),
            border: Border.all(color: Colors.green),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: mediaQuery.width * .04,
              vertical: mediaQuery.height * .01),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
