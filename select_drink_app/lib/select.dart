import 'package:flutter/material.dart';
import 'select_result.dart'; // 追加

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  List<String> baseDrinks = ['アイスコーヒー', 'ホットコーヒー', '紅茶'];
  String selectedBaseDrink = '';
  int selectedBaseDrinkIndex = 0;
  int selectedBaseDrinkPrice = 0; // 初期値は200円

  List<String> toppings = ['ホイップクリーム', 'チョコレートソース', 'ナッツ'];
  String selectedTopping = '';
  int selectedIndex = 0;
  int selectedToppingPrice = 0; // 初期値は100円

  List<int> baseDrinkPrices = [200, 200, 200];
  List<int> toppingPrices = [100, 100, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selectしました！'),
            SizedBox(height: 20),
            Column(
              children: baseDrinks.map((baseDrink) {
                return RadioListTile(
                  value: baseDrink,
                  groupValue: selectedBaseDrink,
                  onChanged: (value) {
                    setState(() {
                      selectedBaseDrink = value as String;
                      selectedBaseDrinkPrice =
                          baseDrinkPrices[baseDrinks.indexOf(value)];
                    });
                  },
                  title: Text(baseDrink),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Column(
              children: toppings.map((topping) {
                return RadioListTile(
                  value: topping,
                  groupValue: selectedTopping,
                  onChanged: (value) {
                    setState(() {
                      selectedTopping = value as String;
                      selectedToppingPrice =
                          toppingPrices[toppings.indexOf(value)];
                    });
                  },
                  title: Text(topping),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('選択されたベースドリンク: $selectedBaseDrink'),
            Text('選択されたトッピング: $selectedTopping'),
            SizedBox(height: 20),
            Text('合計金額: ¥${selectedBaseDrinkPrice + selectedToppingPrice}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final selectedDrink = {
                  'baseDrink': selectedBaseDrink,
                  'baseDrinkPrice': selectedBaseDrinkPrice,
                  'topping': selectedTopping,
                  'toppingPrice': selectedToppingPrice,
                  'totalPrice': selectedBaseDrinkPrice + selectedToppingPrice,
                };

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SelectResultPage(selectedDrink: selectedDrink),
                  ),
                );
              },
              child: Text('カート画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
