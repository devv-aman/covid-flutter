import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/bottom_tabs.dart';
import './pages/news_details.dart';
// import './pages/home.dart';

import './providers/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => COVIDData())],
      child: MaterialApp(
        title: 'COVID 19',
        theme: ThemeData(
          primaryColor: const Color(0xff7777FF),
          canvasColor: Color(0xffF8F8FF),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (_) => BottomTab(),
          NewsDetails.routeName: (ctx) => NewsDetails(),
          // '/': (ctx) => Home(),
        },
      ),
    );
  }
}
