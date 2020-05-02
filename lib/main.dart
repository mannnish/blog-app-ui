import 'package:flutter/services.dart';

import 'rootpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('icons/cube.jpg'), context);
    precacheImage(AssetImage('icons/table.jpg'), context);
    precacheImage(AssetImage('icons/bag.jpg'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}
