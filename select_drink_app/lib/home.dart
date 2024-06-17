import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              text: '選択ページへ',
              onPressed: () {
                Navigator.pushNamed(context, '/select');
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              text: '商品ページへ',
              onPressed: () {
                Navigator.pushNamed(context, '/goods');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// カスタムボタンWidget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 180, // ボタンの幅
        height: 50, // ボタンの高さ
        decoration: BoxDecoration(
          color: Colors.blue, // ボタンの色
          borderRadius: BorderRadius.circular(10), // 角の丸みを設定
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white, // テキストの色
              fontSize: 20, // テキストのサイズ
            ),
          ),
        ),
      ),
    );
  }
}
