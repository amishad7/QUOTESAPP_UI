import 'package:flutter/material.dart';
import 'package:word/pages/one.dart';
import 'package:word/pages/two.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (ctx) => const Home_(),
        'two': (ctx) => const data_(),
      },
    ),
  );
}
