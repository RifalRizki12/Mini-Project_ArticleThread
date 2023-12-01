import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/pages/article.dart';
import 'package:mini_project/pages/login.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/profileMenu.dart';
import 'package:mini_project/pages/thread.dart';
import 'package:mini_project/widget/profilemenulist.dart';

void main() {
  runApp(const MyMiniProject());
}

class MyMiniProject extends StatelessWidget {
  const MyMiniProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      home: LoginPage(),
      routes: {
        '/article': (context) => ArticlePage(),
        '/thread': (context) => ThreadPage(),
        '/logout': (context) => LoginPage(),
        '/profilemenu': (context) => ProfileMenuPage(),
      },
    );
  }
}
