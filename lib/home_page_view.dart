import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.index, required this.onDelete});

  final int index;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final itemColor = Color(index * 0xFF123456).withValues(alpha: 1.0);
    final textColor =
        itemColor.computeLuminance() > 0.2 ? Colors.black : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: itemColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text('Item $index', style: TextStyle(color: textColor)),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
