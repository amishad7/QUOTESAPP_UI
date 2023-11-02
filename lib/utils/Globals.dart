import 'package:flutter/material.dart';

class Global {
  static List img = [
    "first.jpg",
  ];

  static Color imgbackground = Colors.black;
  static Color fontcolor = Colors.white;
  static String defaultimg =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtkTQUXhE90L5atUPtdU_xQVSCu4fYG3A32SeGjB7TYOjsorF7BgAVIESMPTXxD9siz9s&usqp=CAU';
  static List<Map<String, dynamic>> Data = [
    {
      "Category": "Festival",
      "data": [
        {
          'title': 'Diwali',
          'id': 1,
          'favourite': false,
          'quote':
              "Wishing you a festival filled with laughter, good food, and great memories",
          'author': 'Hidden',
        },
        {
          'title': 'Makarskranti',
          'favourite': false,
          'id': 2,
          'quote':
              "Here's to a celebration that overflows with happiness, culinary delights, and lasting recollections.",
          'author': 'Hidden',
        },
        {
          'title': 'new year eve',
          'favourite': false,
          'id': 3,
          'quote':
              "Sending you heartfelt wishes for a festival brimming with laughter, scrumptious treats, and unforgettable experiences.",
          'author': 'Hidden',
        },
      ],
    },
    {
      "Category": "English ",
      "data": [
        {
          'title': 'Halloween',
          'favourite': false,
          'id': 1,
          'quote':
              "Wishing you a festival filled with laughter, good food, and great memories",
          'author': 'Hidden',
        },
        {
          'title': 'New year Eve',
          'favourite': false,
          'id': 2,
          'quote':
              "Here's to a celebration that overflows with happiness, culinary delights, and lasting recollections.",
          'author': 'Hidden',
        },
        {
          'title': 'Summer camp',
          'favourite': false,
          'id': 3,
          'quote':
              "Sending you heartfelt wishes for a festival brimming with laughter, scrumptious treats, and unforgettable experiences.",
          'author': 'Hidden',
        },
      ],
    },
  ];

  static List favouriteItems = [];
}
