import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final ValueChanged<int> onQuantityChanged;

  const ItemListTile({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item['name']),
      subtitle: Text('Rp ${item['price']}'),
      trailing: SizedBox(
        width: 50,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            int quantity = int.tryParse(value) ?? 0;
            onQuantityChanged(quantity);
          },
          decoration: InputDecoration(
            hintText: '0',
          ),
        ),
      ),
    );
  }
}
