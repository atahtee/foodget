import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/food_store.dart';
import 'basket_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final foodStore = Provider.of<FoodStore>(context, listen: false);
    foodStore.fetchFoodItems();
  }

  @override
  Widget build(BuildContext context) {
    final foodStore = Provider.of<FoodStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketScreen()),
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (foodStore.foodItems.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: foodStore.foodItems.length,
              itemBuilder: (context, index) {
                final item = foodStore.foodItems[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    leading: item.image.isNotEmpty
                        ? Image.network(
                            item.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : SizedBox.shrink(),
                    title: Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item.calories} calories'),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: Colors.deepPurple),
                      onPressed: () {
                        foodStore.addToCart(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item.title} added to cart'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
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
