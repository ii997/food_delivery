import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOns, bool> selectedAddOns = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    for (AddOns addon in food.availableAddOns) {
      selectedAddOns[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addtoCart(Food food, Map<AddOns, bool> selectedAddOns) {
  
    Navigator.pop(context);


    List<AddOns> currentlySelectedAddons = [];
    for(AddOns addon in widget.food.availableAddOns){
      if(widget.selectedAddOns[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        //Scaffold UI

        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Column(
            children: [
              Image.asset(widget.food.imagePath),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.food.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.primary)),
                    Text(
                      '\$${widget.food.price}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(widget.food.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15)),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Adds-on',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(11)),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddOns.length,
                        itemBuilder: (context, index) {
                          AddOns addon = widget.food.availableAddOns[index];
                          return CheckboxListTile(
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              title: Text(
                                addon.name,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: widget.selectedAddOns[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddOns[addon] = value!;
                                });
                              });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () => addtoCart(widget.food, widget.selectedAddOns),
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color:
                                  Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        SafeArea(
            child: Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary),
            margin: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ))
      ],
    );
  }
}
