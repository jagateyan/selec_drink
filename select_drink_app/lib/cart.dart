import 'package:flutter/material.dart';
import 'result.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カートページ'),
      ),
      body: widget.cart.isEmpty
          ? Center(child: Text('カートに商品がありません'))
          : ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final product = widget.cart[index];

                return ListTile(
                  leading: Image.network(product['image']),
                  title: Text(product['name']),
                  subtitle: Text('¥${product['price']}'),
                );
              },
            ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          // 購入確定処理
          final totalAmount = calculateTotalAmount(widget.cart);
          //final productNames = getProductNames(widget.cart);
          final productQuantities = getProductQuantities(widget.cart);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                totalAmount: totalAmount,
                //productNames: productNames,
                productQuantities: productQuantities,
              ),
            ),
          );
        },
        child: Text('購入確定'),
      ),
    );
  }

  // カート内の商品合計金額を計算する関数
  double calculateTotalAmount(List<Map<String, dynamic>> cart) {
    double totalAmount = 0;
    for (final product in cart) {
      totalAmount += product['price'];
    }
    return totalAmount;
  }

  // カート内の商品名を取得する関数
  List<String> getProductNames(List<Map<String, dynamic>> cart) {
    final productNames = <String>[];
    for (final product in cart) {
      productNames.add(product['name']);
    }
    return productNames;
  }

  // カート内の商品ごとの合計数を取得する関数
  Map<String, int> getProductQuantities(List<Map<String, dynamic>> cart) {
    final productQuantities = <String, int>{};
    for (final product in cart) {
      final productName = product['name'];
      if (productQuantities.containsKey(productName)) {
        productQuantities[productName] = productQuantities[productName]! + 1;
      } else {
        productQuantities[productName] = 1;
      }
    }
    return productQuantities;
  }
}
