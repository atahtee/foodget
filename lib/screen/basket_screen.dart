import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Basket'),
        actions: [
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Checkout'),
                    content: Text('Total items: 0'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text('Basket is empty'), // Update this to show actual basket items
      ),
    );
  }
}
