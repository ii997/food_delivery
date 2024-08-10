import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_text_field.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MyButton(
                  text: 'LOGIN',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Not a member yet?',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ));
                          },
                        text: ' Register',
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
