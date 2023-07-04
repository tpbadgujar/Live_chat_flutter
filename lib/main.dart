import 'package:flutter/material.dart';
import 'package:ive_chat_flutter/message_model.dart';
import 'package:ive_chat_flutter/screens/chat.dart';
import 'package:ive_chat_flutter/screens/home.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

List<String> users = [];
void connectAndListen() {
  socket = io(
      'http://10.0.2.2:8000',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());

  socket.connect();

  socket.on('getusers', (data) => {
    print(data),
  });
  //When an event recieved from server, data is added to the stream
  socket.on('privateMessage', (data) => {print(data)});

  socket.onDisconnect((_) => print('disconnect'));
  /*Message msg =
      Message(message: "This is the Test Message", id: "LGLT3JP-wFJToPcnAAAD");
  socket.emit("sendMessage", msg);
*/
}



void OnMessageReceived(MessageModel msg) {
  Chat.messages.add(msg);
}

void OnMessageSend(MessageModel msg) {
  Chat.messages.add(msg);
  socket.emit("sendMessage", msg);
}

void main() {
  connectAndListen();
  runApp(const MyApp());
}

late Size mediaQuery;
late Socket socket;
late String? name;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            centerTitle: true,
            elevation: 7,
            titleTextStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        home: const Home()
        // home: const Splash(),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
