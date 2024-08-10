import 'food.dart';

class CartItem {
  Food food;
  List<AddOns> selectedAddOns;
  int quantity;

  CartItem(
      {required this.food, this.quantity = 1, required this.selectedAddOns});

  double get totalPrice {
    double addonsprice =
        selectedAddOns.fold(0, (sum, addon) => sum + addon.price);
        return (food.price + addonsprice) * quantity;
  }
}
