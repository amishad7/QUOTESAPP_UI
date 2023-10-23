import 'package:flutter/material.dart';
import 'package:word/utils/Globals.dart';

class Home_ extends StatefulWidget {
  const Home_({super.key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...Global.Data.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'two', arguments: e);
                          },
                          child: Container(
                            height: 190,
                            width: 325,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment(0, 0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              // image: DecorationImage(
                              //   fit: BoxFit.cover,
                              //   image: NetworkImage(
                              //       "https://a.cdn-hotels.com/gdcs/production198/d134/685083f0-b96d-4a89-a694-f9fbaa9f44fa.jpg?impolicy=fcrop&w=800&h=533&q=medium"),
                              // ),
                            ),
                            child: Text(
                              "${e['title']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
