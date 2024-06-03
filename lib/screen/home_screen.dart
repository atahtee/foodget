import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/food_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<FoodStore>(context, listen: false).fetchFoodItems());
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
              // Navigate to BasketScreen (not provided in the original snippet)
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => BasketScreen()),
              // );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (foodStore.foodItems.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: foodStore.foodItems.length,
              itemBuilder: (context, index) {
                final item = foodStore.foodItems[index];
                return ListTile(
                  leading: item.image.isNotEmpty
                      ? Image.network(item.image)
                      : SizedBox.shrink(),
                  title: Text(item.title),
                  subtitle: Text(item.calories != null
                      ? 'Calories: ${item.calories}'
                      : 'No calorie info'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Add to basket functionality here
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


//experience