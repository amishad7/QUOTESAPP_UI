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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'three');
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 45),
            Row(
              children: [
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(width: 10),
                Text(
                  "Profile",
                  style: GoogleFonts.poppins().copyWith(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 27),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 19),
                  Icon(Icons.favorite_border_rounded,
                      color: Colors.redAccent.shade100, size: 28),
                  SizedBox(width: 16),
                  Text(
                    "Favourite",
                    style: GoogleFonts.poppins().copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 19),
                  Icon(Icons.settings, color: Colors.black, size: 30),
                  SizedBox(width: 16),
                  Text(
                    "Settings",
                    style: GoogleFonts.poppins().copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 19),
                  Icon(Icons.settings, color: Colors.black, size: 30),
                  SizedBox(width: 16),
                  Text(
                    "About",
                    style: GoogleFonts.poppins().copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                                child: Card(
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
