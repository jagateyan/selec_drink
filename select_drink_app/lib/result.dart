import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double totalAmount;
  final Map<String, int> productQuantities;

  ResultPage({required this.totalAmount, required this.productQuantities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('購入完了ページ'),
      ),
      body: Column(
        children: [
          Text('合計金額: ¥${totalAmount.toStringAsFixed(2)}'),
          Expanded(
            child: ListView.builder(
              itemCount: productQuantities.length,
              itemBuilder: (context, index) {
                final productName = productQuantities.keys.elementAt(index);
                final quantity = productQuantities[productName]!;
                return ListTile(
                  title: Text(productName),
                  trailing: Text('x $quantity'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
