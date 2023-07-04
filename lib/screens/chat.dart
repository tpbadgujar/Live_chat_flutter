import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ive_chat_flutter/main.dart';

import '../message_model.dart';
import '../widget/message_widget.dart';

class Chat extends StatefulWidget {
  static List<MessageModel> messages = [];

  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Row(children: [
            const IconButton(
              onPressed: null,
              icon: Icon(CupertinoIcons.arrow_left),
              color: Colors.black,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(mediaQuery.height * .03),
              child: CachedNetworkImage(
                width: mediaQuery.height * .05,
                height: mediaQuery.height * .05,
                imageUrl:
                    "https://media.istockphoto.com/id/1461631485/photo/group-of-young-students-checking-exam-results-or-waiting-for-project-approval-on-laptop-at.jpg?s=2048x2048&w=is&k=20&c=vamun-ikGUrP3zQSGr6LRPmm-qAodDmrPyg_gZkaXR4=",
                errorWidget: (context, url, error) =>
                    const CircleAvatar(child: Icon(CupertinoIcons.person)),
              ),
            ),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Group Chat',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      color: Colors.black),
                ),
                Text(
                  'Last Seen',
                  style: TextStyle(fontSize: 15),
                )
              ],
            )
          ]),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return MessageCard(Chat.messages[index]);
                    },
                    itemCount: Chat.messages.length)),

            //Text Input Field
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.width * .03,
                  vertical: mediaQuery.height * .01),
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.emoji_emotions,
                              color: Colors.blue,
                            )),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Your Message Here',
                                hintStyle: TextStyle(color: Colors.lightBlue),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const MaterialButton(
                    color: Colors.green,
                    minWidth: 0,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 5, left: 10),
                    shape: CircleBorder(),
                    onPressed: null,
                    child: Icon(Icons.send, color: Colors.green, size: 28),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
