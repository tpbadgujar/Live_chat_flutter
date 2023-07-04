import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'chat.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: .2, vertical: 7),
              child: Card(
                shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                color: Colors.blueAccent,
                child: Text(
                  users[index],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          },
          itemCount: users.length,
          padding: EdgeInsets.all(10)),
    );
  }
}
