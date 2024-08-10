import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            obscureText: isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ), 
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
