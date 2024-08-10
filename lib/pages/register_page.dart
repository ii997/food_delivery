import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
           body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 85,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: TextEditingController(),
                    hintText: 'Email Address',
                    isObscure: false),
                MyTextField(
                    controller: TextEditingController(),
                    hintText: 'Password',
                    isObscure: true),
                MyButton(text: 'Sign Up', onTap: () {
                  
                },),
                const SizedBox(
                  height: 25,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already a member?',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.pop(context);
                        },
                        text: ' Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
