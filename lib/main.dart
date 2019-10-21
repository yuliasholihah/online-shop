import 'package:flutter/material.dart';
import 'package:reseller/beranda/beranda_view.dart';
import 'package:reseller/beranda/login_page.dart';
import 'package:reseller/constant.dart';

//import 'package:reseller/launcher/launcher_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    BerandaPage.tag: (context) => BerandaPage(),
  };
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
      home: new LoginPage(),
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
