import 'package:mobx/mobx.dart';
import '../models/food_item.dart';
import '../services/isar_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'food_store.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  final IsarService _isarService = IsarService();

  @observable
  ObservableList<FoodItem> foodItems = ObservableList<FoodItem>();

  @action
  Future<void> fetchFoodItems() async {
    if (await _isarService.isFoodItemsEmpty()) {
      final response = await http.get(Uri.parse('https://api.spoonacular.com/food/search?apiKey=4fea14b6f3b24c6d970fa17c33fd72e1'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['searchResults'] as List;
        List<FoodItem> items = [];

        for (var result in data) {
          for (var item in result['results']) {
            items.add(FoodItem()
              ..title = item['name']
              ..calories = item['calories'] ?? 0 // Assuming you want to set calories; change if necessary
              ..image = item['image']
              ..link = item['link']);
          }
        }

        await _isarService.addFoodItems(items);
        foodItems.addAll(items);
      } else {
        throw Exception('Failed to load food items');
      }
    } else {
      foodItems.addAll(await _isarService.getFoodItems());
    }
  }
}