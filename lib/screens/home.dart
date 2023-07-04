import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:ive_chat_flutter/main.dart';
import 'package:ive_chat_flutter/screens/chat.dart';
import 'package:ive_chat_flutter/screens/users.dart';
import 'package:ive_chat_flutter/utils/StreamSocket.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimated = true;
      });
    });
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.home,
          color: Colors.black,
        ),
        title: const Text(
          'Flutter Chat',
        ),
      ),
      body: Card(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: mediaQuery.width * .7,
            height: mediaQuery.width * .4,
            child: Column(
              children: [
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.lightBlue),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                MaterialButton(
                  onPressed: () => {saveName()},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      const Text("Save", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),

/*
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.2),
        child: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(CupertinoIcons.add),
        ),
      ),
*/
    );
  }

  saveName() {
    print(myController.text);
    Message message = Message(message: myController.text, id: socket.id);
    socket.emit("setName", message);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const UsersScreen()));
  }
}
