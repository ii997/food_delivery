import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.buttonText,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style:  ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
            shape: const WidgetStatePropertyAll(LinearBorder())),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10,),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
