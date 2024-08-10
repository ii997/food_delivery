import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_receipt.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Delivery in progress...',
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: const Column(
        children: [MyReceipt()],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Theme.of(context).colorScheme.secondary),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface),
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mitch Koko',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('Rider')
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface),
                  child: IconButton(
                    icon: Icon(Icons.message_rounded),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface),
                  child: IconButton(
                    icon: Icon(Icons.call_rounded, color: Colors.green,),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
