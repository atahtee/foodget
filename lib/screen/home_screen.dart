import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodget/screen/basket_screen.dart';
import '../stores/food_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodStore _foodStore = FoodStore();

  @override
  void initState() {
    super.initState();
    _foodStore.fetchFoodItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BasketScreen(foodStore: _foodStore),
                ),
              );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (_foodStore.foodItems.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _foodStore.foodItems.length,
              itemBuilder: (context, index) {
                final item = _foodStore.foodItems[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('${item.calories} calories'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),

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
