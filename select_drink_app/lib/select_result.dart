import 'package:flutter/material.dart';

class SelectResultPage extends StatelessWidget {
  final Map<String, dynamic> selectedDrink;

  const SelectResultPage({Key? key, required this.selectedDrink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注文内容'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ご注文ありがとうございます！'),
            SizedBox(height: 20),
            Text('選択された商品:'),
            SizedBox(height: 10),
            Text('ベースドリンク: ${selectedDrink['baseDrink']}'),
            Text('トッピング: ${selectedDrink['topping']}'),
            SizedBox(height: 20),
            Text('合計金額: ¥${selectedDrink['totalPrice']}'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // 1つ前の画面に戻る
              },
              child: Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
