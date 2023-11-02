import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
        ),
      ),
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...Global.Data.map(
                (e) {
                  List q = e['data'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${e['Category']}",
                          style: const TextStyle(
                              fontSize: 23, color: Colors.black),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...q.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "two",
                                    arguments: e,
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3.6,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  ),
                                ),
                              ),
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
    );
  }
}
