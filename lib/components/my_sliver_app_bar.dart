import 'package:flutter/material.dart';

import '../pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.child, required this.title});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      foregroundColor: Theme.of(context).colorScheme.tertiary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text('Sunset Diner'),
      centerTitle: true,
      expandedHeight: 320,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
