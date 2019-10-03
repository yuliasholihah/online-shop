import 'package:flutter/material.dart';
import 'package:reseller/constant.dart';
import 'package:reseller/launcher/launcher_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reseller',
      theme: new ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: GojekPalette.green,
        accentColor: GojekPalette.green,
      ),
      home: new LauncherPage(),
    );
  }
}
//import 'package:flutter/material.dart';
//import 'package:reseller/beranda/detail.dart';
//import 'package:reseller/constant.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Reseller',
//      theme: new ThemeData(
//        fontFamily: 'NeoSans',
//        primaryColor: GojekPalette.green,
//        accentColor: GojekPalette.green,
//      ),
//      home: new Detail(),
//    );
//  }
//}
