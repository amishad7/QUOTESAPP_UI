import 'package:flutter/material.dart';
import 'package:word/pages/one.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (ctx) => const Home_(),
      },
    ),
  );
}
