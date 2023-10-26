import 'package:flutter/material.dart';
import 'package:word/Model/model.dart';
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
                        (e) {
                          return Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.6,
                                width: MediaQuery.of(context).size.width / 1.1,
                                //     margin: EdgeInsets.symmetric(vertical: 20),
                                alignment: Alignment.topCenter,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${e['title']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: 40,
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5.6,
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Text("j"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
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
