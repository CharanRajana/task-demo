import 'package:flutter/material.dart';
import 'package:task_demo/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo,
        appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      ),
      home: const Homepage(),
    );
  }
}
