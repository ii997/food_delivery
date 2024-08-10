import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        //scaffold ui
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.primary,
            title: const Text('Orders'),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Row(
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: 250,
                                child: Text(
                                  'Are you sure you want to clear your cart?',
                                  style: TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              restaurant.clearCart();
                            },
                            child: const Text('Yes'),
                          ),
                          MaterialButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.red,
                  ))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                            child: Lottie.asset(
                                'lotties-anims/empy-lottie-anim.json',
                                height: 320,
                                fit: BoxFit.cover),
                          ))
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                return MyCartTile(cartItem: userCart[index]);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              MyButton(
                text: 'Continue to payment',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
