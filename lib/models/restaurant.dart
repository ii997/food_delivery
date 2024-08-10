import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
        name: 'Meat Burger',
        description:
            'Instead of making a bean-based burger, I make this recipe with shiitake and portobello mushrooms! ',
        imagePath: 'lib/imgs/burgers/vegan-burger.jpg',
        price: 2.99,
        availableAddOns: [
          AddOns(name: 'Cheese', price: 0.99),
          AddOns(name: 'Avocado', price: 1.99),
          AddOns(name: 'Pickle', price: 0.59),
        ],
        category: FoodCategory.burger),

    Food(
        name: 'Vegan Burger',
        description:
            'Instead of making a bean-based burger, I make this recipe with shiitake and portobello mushrooms!',
        imagePath: 'lib/imgs/burgers/vegan-burger.jpg',
        price: 2.99,
        availableAddOns: [
          AddOns(name: 'Lettuce', price: 0.99),
          AddOns(name: 'Avocado', price: 1.99),
          AddOns(name: 'Pickle', price: 0.59),
        ],
        category: FoodCategory.burger),

    Food(
        name: 'Ceasar Salad',
        description:
            'Instead of making a bean-based burger, I make this recipe with shiitake and portobello mushrooms!',
        imagePath: 'lib/imgs/salads/salad.jpg',
        price: 2.99,
        availableAddOns: [
          AddOns(name: 'Lettuce', price: 0.99),
          AddOns(name: 'Avocado', price: 1.99),
          AddOns(name: 'Pickle', price: 0.59),
        ],
        category: FoodCategory.salads),
  ];

  List<Food> get menu => _menu;
  final List<CartItem> _cart = [];
 String _deliveryAddress = '001';
  List<CartItem> get cart => _cart;
 String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<AddOns> selectedAddOns) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddOn =
          const ListEquality().equals(item.selectedAddOns, selectedAddOns);

      return isSameAddOn && isSameFood;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOns addon in cartItem.selectedAddOns) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;

    notifyListeners();
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('---------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddsOn(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");


    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddsOn(List<AddOns> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
