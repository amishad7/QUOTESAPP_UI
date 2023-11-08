import 'package:flutter/material.dart';
import 'package:word/pages/intro.dart';
import 'package:word/pages/ondart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (ctx) => const SplashScreen(),
        'one': (ctx) => const Home_(),
        'two': (ctx) => const info_Page(),
      },
    ),
  );
}
