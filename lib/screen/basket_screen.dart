import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/food_store.dart';

class BasketScreen extends StatelessWidget {
  final FoodStore foodStore;

  BasketScreen({required this.foodStore});

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
                  return Observer(
                    builder: (_) {
                      return AlertDialog(
                        title: Text('Checkout'),
                        content: Text('Total price: \$${foodStore.totalCartPrice.toStringAsFixed(2)}'),
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
              );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (foodStore.cartItems.isEmpty) {
            return Center(child: Text('Basket is empty'));
          } else {
            return ListView.builder(
              itemCount: foodStore.cartItems.length,
              itemBuilder: (context, index) {
                final item = foodStore.cartItems[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('\$${item.price?.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      foodStore.removeFromCart(item);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}