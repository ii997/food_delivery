import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.inversePrimary),
            shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
