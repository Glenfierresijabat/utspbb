import 'package:flutter/material.dart';
import 'item_list_tile.dart';
import 'receipt_list_tile.dart';

class TokoKomputerScreen extends StatefulWidget {
  @override
  _TokoKomputerScreenState createState() => _TokoKomputerScreenState();
}

class _TokoKomputerScreenState extends State<TokoKomputerScreen> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Laptop', 'price': 25000000, 'quantity': 0},
    {'name': 'Mouse', 'price': 1250000, 'quantity': 0},
    {'name': 'Keyboard', 'price': 1500000, 'quantity': 0},
    {'name': 'Monitor', 'price': 5000000, 'quantity': 0},
    {'name': 'Printer', 'price': 2200000, 'quantity': 0},
  ];

  int total = 0;

  void updateTotal() {
    int newTotal = 0;
    for (var item in items) {
      newTotal += (item['price'] as int) * (item['quantity'] as int);
    }
    setState(() {
      total = newTotal;
    });
  }

  void reset() {
    setState(() {
      for (var item in items) {
        item['quantity'] = 0;
      }
      total = 0;
    });
  }

  void cetakStruk() {
    updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Komputer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return ItemListTile(
                    item: item,
                    onQuantityChanged: (quantity) {
                      setState(() {
                        item['quantity'] = quantity;
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: reset,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: cetakStruk,
                  child: Text('Cetak Struk'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  if (item['quantity'] > 0) {
                    return ReceiptListTile(item: item);
                  }
                  return Container();
                }).toList(),
              ),
            ),
            Divider(),
            Text(
              'Total: Rp $total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
