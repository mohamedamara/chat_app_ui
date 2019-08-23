import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/chat_list.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF1e2732),
      systemNavigationBarColor: const Color(0xFF1e2732),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App UI',
      home: ChatList(),
    );
  }
}
