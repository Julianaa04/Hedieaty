import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'Event_List.dart';
import 'Gift_List.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/route1', // Set the initial route to HomePage
  routes: {
    '/route1': (context) => HomePage(),
    '/route2': (context) => ProfilePage(),
    '/route3': (context) => EventListPage(),
    '/route4': (context) => GiftListPage()
  },
));
