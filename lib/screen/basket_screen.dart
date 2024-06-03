import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/food_store.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodStore = Provider.of<FoodStore>(context);

    double getTotalPrice() {
      return foodStore.cartItems.fold(0.0, (sum, item) => sum + item.price);
    }

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
                    content: Text('Total items: ${foodStore.cartItems.length}\nTotal price: \$${getTotalPrice().toStringAsFixed(2)}'),
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
                  leading: item.image.isNotEmpty
                      ? Image.network(item.image)
                      : SizedBox.shrink(),
                  title: Text(item.title),
                  subtitle: Text('${item.calories} calories\n\$${item.price.toStringAsFixed(2)}'),
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