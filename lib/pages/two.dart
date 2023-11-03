import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word/utils/Globals.dart';

class info_Page extends StatefulWidget {
  const info_Page({super.key});

  @override
  State<info_Page> createState() => _info_PageState();
}

class _info_PageState extends State<info_Page> {
  GlobalKey repaintBoudrykey = GlobalKey();

  ShareImage() async {
    var repaintObjet = repaintBoudrykey.currentContext!.findRenderObject()
        as RenderRepaintBoundary;

    var imgData = await repaintObjet.toImage(pixelRatio: 3);

    var imgBytedata = await imgData.toByteData(format: ImageByteFormat.png);

    Uint8List myimgU8intList = imgBytedata!.buffer.asUint8List();

    Directory? directory = await getDownloadsDirectory();

    File file = File('${directory!.path}.png');

    Share.shareXFiles([XFile(file.path)]);
  }

  copyText({required String Textdata}) {
    Clipboard.setData(
      ClipboardData(
        text: Textdata,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Global.imgbackground = Colors.black;
            Global.fontcolor = Colors.white;
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  copyText(Textdata: data['quote']);
                  log("done");
                },
                child: const Text("Copy"),
              ),
              PopupMenuItem(
                onTap: () {
                  ShareImage();
                  log("image share done");
                },
                child: const Text("Share"),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepaintBoundary(
              key: repaintBoudrykey,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(23),
                margin: const EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height / 2.6,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 18),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 7.9,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                          margin: const EdgeInsets.only(left: 12, right: 10),
                          height: MediaQuery.of(context).size.height / 10.3,
                          width: MediaQuery.of(context).size.width / 5.9,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(14),
                            color: e,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(4, 5),
                                blurRadius: 2,
                              ),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.9,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //   child: Text(
            //     "Background Image",
            //     style: GoogleFonts.inter().copyWith(
            //       fontSize: 30,
            //       letterSpacing: -2,
            //       color: Colors.black.withOpacity(0.7),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 6.9,
            //   child: SingleChildScrollView(
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         ...Global.img.map((e) {
            //           return GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 Global.defaultimg = e;
            //               });
            //             },
            //             child: Container(
            //               margin: const EdgeInsets.symmetric(horizontal: 10),
            //               height: MediaQuery.of(context).size.height / 7.6,
            //               width: MediaQuery.of(context).size.width / 4.1,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(24),
            //                 image: DecorationImage(
            //                     image: AssetImage(
            //                       e,
            //                     ),
            //                     fit: BoxFit.cover),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.black.withOpacity(0.25),
            //                     offset: const Offset(4, 5),
            //                     blurRadius: 2,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         }),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
