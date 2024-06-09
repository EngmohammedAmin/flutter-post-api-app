import 'package:flutter/material.dart';
import 'package:post_api_app/screens/posts_screen.dart';

// Thes project by Eng/Mohammed Amin Alathwari
//برمجة وتطوير المهندس محمد أمين


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsScreen(),
    );
  }
}
