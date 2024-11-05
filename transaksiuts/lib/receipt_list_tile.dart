import 'package:flutter/material.dart';

class ReceiptListTile extends StatelessWidget {
  final Map<String, dynamic> item;

  const ReceiptListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subtotal = item['price'] * item['quantity'];
    return ListTile(
      title: Text(item['name']),
      subtitle: Text('${item['price']} x ${item['quantity']}'),
      trailing: Text('Rp $subtotal'),
    );
  }
}
