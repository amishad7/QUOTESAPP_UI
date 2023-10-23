import 'package:flutter/material.dart';

class data_ extends StatefulWidget {
  const data_({super.key});

  @override
  State<data_> createState() => _data_State();
}

class _data_State extends State<data_> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List d = data['Quotes'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...d.map(
            (e) => Container(
              height: 130,
              width: 340,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Text(
                "${data['quote']}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
