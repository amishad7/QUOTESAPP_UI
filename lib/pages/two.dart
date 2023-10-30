import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word/utils/Globals.dart';

class info_Page extends StatefulWidget {
  const info_Page({super.key});

  @override
  State<info_Page> createState() => _info_PageState();
}

class _info_PageState extends State<info_Page> {
  copyText({required String Textdata}) {
    Clipboard.setData(
      ClipboardData(
        text: Textdata,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(
                    onTap: () {
                      copyText(Textdata: data['quote']);
                      log("done");
                    },
                    child: Text("Copy")),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(23),
              margin: const EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.height / 2.6,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: Global.imgbackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    Global.defaultimg,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    "${data['quote']}",
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Global.fontcolor),
                  ),
                  SelectableText(
                    "- ${data['author']}",
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Global.fontcolor),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Background Colors",
                style: GoogleFonts.inter().copyWith(
                  fontSize: 30,
                  letterSpacing: -2,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...Colors.primaries.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.imgbackground = e;
                            Global.defaultimg = '';
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height / 7.6,
                          width: MediaQuery.of(context).size.width / 4.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: e,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(4, 5),
                                  blurRadius: 2),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Font Colors",
                style: GoogleFonts.inter().copyWith(
                  fontSize: 30,
                  letterSpacing: -2,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...Colors.primaries.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.fontcolor = e;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height / 7.6,
                          width: MediaQuery.of(context).size.width / 4.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: e,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(4, 5),
                                  blurRadius: 2),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Background Image",
                style: GoogleFonts.inter().copyWith(
                  fontSize: 30,
                  letterSpacing: -2,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...Global.img.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.defaultimg = e;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height / 7.6,
                          width: MediaQuery.of(context).size.width / 4.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: NetworkImage(e), fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(4, 5),
                                  blurRadius: 2),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
