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
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "two",
                                      arguments: e);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3.6,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  //     margin: EdgeInsets.symmetric(vertical: 20),
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.topLeft,
                                    height: MediaQuery.of(context).size.height /
                                        3.6,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://st.depositphotos.com/1030575/1200/i/450/depositphotos_12004953-stock-photo-natural-green-background-with-green.jpg"),
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 50),
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                        ),
                                      ),
                                      child: Text(
                                        "${e['title']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
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
