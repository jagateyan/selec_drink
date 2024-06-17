import 'package:flutter/material.dart';
import 'package:select_drink_app/home.dart';
import 'package:select_drink_app/select.dart';
import 'package:select_drink_app/goods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/', // 初期画面を '/' に設定
      routes: {
        '/': (context) => MyHomePage(), // '/' に MyHomePage を割り当て
        '/select': (context) => SelectPage(), // '/select' に SelectPage を割り当て
        '/goods': (context) => GoodsPage(), // '/goods' に GoodsPage を割り当て
      },
    );
  }
}
