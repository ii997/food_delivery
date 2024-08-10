import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/pages/delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController cardNumber = TextEditingController();
    TextEditingController expiryDate = TextEditingController();
    TextEditingController cardHolderName = TextEditingController();
    TextEditingController cvvCode = TextEditingController();
    bool isCvvFocused = false;

    void userTappedPay() {
      if (formKey.currentState!.validate()) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Payment!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number: ${cardNumber.text}"),
                  Text("Expiry: ${expiryDate.text}"),
                  Text("CVV: ${cvvCode.text}"),
                  Text("Cardholder Name: ${cardHolderName.text}"),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeliveryPage(),
                      ));
                },
                child: const Text('Yes'),
              )
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(
            
            child: Form(

              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: cardNumber,
                      decoration: const InputDecoration(hintText: 'Number'),
                    ),
                    TextFormField(
                      controller: expiryDate,
                      decoration:
                          const InputDecoration(hintText: 'Expiry Date'),
                    ),
                    TextFormField(
                      controller: cvvCode,
                      decoration: const InputDecoration(hintText: 'CVV'),
                    ),
                    TextFormField(
                      controller: cardHolderName,
                      decoration:
                          const InputDecoration(hintText: 'Cardholder Name'),
                    )
                  ],
                ),
              ),
            ),
          ),
          MyButton(
            text: 'Pay Now',
            onTap: userTappedPay,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
