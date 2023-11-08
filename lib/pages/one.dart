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
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline_rounded),
          ),
        ],
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
                              (e) => GestureDetector(
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
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e['quote']}",
                                                style: GoogleFonts.poppins()
                                                    .copyWith(fontSize: 18),
                                              ),
                                              Text(
                                                "- ${e['author']}",
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
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
