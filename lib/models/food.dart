class Food  {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<AddOns> availableAddOns;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.availableAddOns,
    required this.category
  });
}

// food categories

enum FoodCategory {
  burger,
  salads,
 
}

class AddOns {
  final String name;
  final double price;

  AddOns({required this.name, required this.price});
}
