import 'package:flutter/material.dart';
import 'package:word/pages/intro.dart';
import 'package:word/pages/one.dart';
import 'package:word/pages/three.dart';
import 'package:word/pages/two.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (ctx) => const SplashScreen(),
        'one': (ctx) => const Home_(),
        'two': (ctx) => const info_Page(),
        'three': (ctx) => const Create_(),
      },
    ),
  );
}
