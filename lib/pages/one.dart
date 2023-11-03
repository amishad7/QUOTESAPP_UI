import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word/utils/Globals.dart';

class Home_ extends StatefulWidget {
  const Home_({super.key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  @override
  Widget build(BuildContext context) {
    String TabIndex = "Latest";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade50,
        onPressed: () {
          Navigator.pushNamed(context, 'three');
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 10, left: 12),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Explore",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Latest",
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.green,
                                fontSize: 20,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Diwali",
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.green,
                                fontSize: 20,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Images",
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.green,
                                fontSize: 20,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ...Global.Data.map(
                (e) {
                  List q = e['data'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            ...q.map(
                              (e) =>
                  (TabIndex == e['title']) ? GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "two",
                                    arguments: e,
                                  );
                                },
                                child: Card(
                                  surfaceTintColor: Colors.greenAccent,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    height: MediaQuery.of(context).size.height /
                                        3.9,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment(1.1, -1),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  e['favourite'] =
                                                      !e['favourite'];
                                                  if (e['favourite'] == true) {
                                                    Global.favouriteItems
                                                        .add(e);
                                                    if (e['favourite'] !=
                                                        true) {
                                                      Global.favouriteItems
                                                          .remove(e);
                                                    }
                                                  }
                                                },
                                              );
                                            },
                                            icon: (e['favourite'] != true)
                                                ? Icon(
                                                    Icons.star_border,
                                                  )
                                                : Icon(
                                                    Icons.star,
                                                  ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${e['quote']}",
                                            style: GoogleFonts.poppins()
                                                .copyWith(fontSize: 18),
                                          ),
                                        ),
                                      ],
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
