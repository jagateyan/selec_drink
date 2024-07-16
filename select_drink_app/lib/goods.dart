import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cart.dart'; // cart.dartファイルをインポート
//import 'package:flutter/services.dart';

// 商品データ
List<Map<String, dynamic>> _products = [
  {
    'image': 'assets/images/コーラ.jpg', // 実際のファイル名に置き換えてください
    'name': 'コーラ',
    'price': 170,
  },
  {
    'image': 'assets/images/fanta_orange.png',
    'name': 'ファンタオレンジ',
    'price': 170,
  },
  {
    'image': 'assets/images/Calpis_Logo.png',
    'name': 'カルピス',
    'price': 170,
  },
  {
    'image': 'assets/images/CC_Lemon.png',
    'name': 'ccレモン',
    'price': 150,
  },
  {
    'image': 'assets/images/canada-dry.png',
    'name': 'Canada Dry ジンジャーエール',
    'price': 170,
  },
  {
    'image': 'assets/images/dodekamin.jpg',
    'name': 'ドデカミン',
    'price': 140,
  },
  {
    'image': 'assets/images/oro_c.png',
    'name': 'オロナミンC',
    'price': 120,
  },
  {
    'image': 'assets/images/gogo_t.jpg',
    'name': '午後の紅茶ミルクティー',
    'price': 230,
  },
  // ... ここに商品データを複数追加
];

// カート内の商品リスト
List<Map<String, dynamic>> _cart = [];

void _showCartToast(String productName) {
  Fluttertoast.showToast(
    msg: '$productName をカートに追加しました！',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class GoodsPage extends StatefulWidget {
  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goodsページ'),
      ),
      body: Column(
        // 商品一覧と購入ボタンをColumnで縦方向に配置
        children: [
          Expanded(
            // 商品一覧を占める割合を調整
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(product['image']),
                    title: Text(product['name']),
                    subtitle: Text('¥${product['price']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _cart.add(product);
                          _showCartToast(product['name']);
                        });
                      },
                      child: Text('カートに追加'),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            // 購入ボタン
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CartPage(cart: _cart)), // cart.dartページに遷移
              );
            },
            child: Text('購入へ進む'),
          ),
        ],
      ),
    );
  }
}
