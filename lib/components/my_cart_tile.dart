import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import '../models/restaurant.dart';

class MyCartTile extends StatefulWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  State<MyCartTile> createState() => _MyCartTileState();
}

class _MyCartTileState extends State<MyCartTile> {
  @override
  Widget build(BuildContext context) {
    final cartItem = widget.cartItem;
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        margin: const EdgeInsets.only(right: 15, left: 15, top: 10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              //
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  //Spacer(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary ),),
                      Text('\$${cartItem.food.price.toString()}',style:TextStyle( color: Theme.of(context).colorScheme.primary ),),
                    ],
                  ),
                  const Spacer(),
                  MyQuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: () {
                      restaurant.addToCart(
                          cartItem.food, cartItem.selectedAddOns);
                    },
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                  )
                ],
              ),
            //const SizedBox(height: 10,),
              SizedBox(
                height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
                child: ListView(
                  padding: const EdgeInsets.only(left: 5, top: 5,  right: 5),
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddOns
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name),
                                Text(' (\$${addon.price})')
                              ],
                            ),
                            
                            shape: const StadiumBorder(),
                            onSelected: (value) {},
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            labelStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.primary,
                                fontSize: 12),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
