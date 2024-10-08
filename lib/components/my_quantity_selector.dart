import 'package:flutter/material.dart';
import '../models/food.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child:  Icon(Icons.remove, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              width: 20,
              child: Center(child: Text(quantity.toString(), style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
            ),
            
            GestureDetector(
              onTap: onIncrement,
              child:  Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
      ),
    );
  }
}
