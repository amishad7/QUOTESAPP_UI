import 'package:flutter/material.dart';

class Create_ extends StatefulWidget {
  const Create_({super.key});

  @override
  State<Create_> createState() => _Create_State();
}

class _Create_State extends State<Create_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 5,
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
