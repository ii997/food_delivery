import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('\$0.99', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              Text('Delivery Fee',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
            ],
          ),
          Column(
            children: [
              Text('15-30 mins',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              Text('Delivery Time',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
            ],
          )
        ],
      ),
    );
  }
}
