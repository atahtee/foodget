import 'package:mobx/mobx.dart';
import '../models/food_item.dart';
import '../services/isar_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'food_store.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  final IsarService _isarService = IsarService();

  @observable
  ObservableList<FoodItem> foodItems = ObservableList<FoodItem>();

  @observable
  ObservableList<FoodItem> cartItems = ObservableList<FoodItem>();

  @action
  Future<void> fetchFoodItems() async {
    if (await _isarService.isFoodItemsEmpty()) {
      final apiKey = dotenv.env['API_KEY'];
      final response = await http.get(Uri.parse('https://api.spoonacular.com/food/search?apiKey=$apiKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['searchResults'] as List;

        List<FoodItem> items = [];
        for (var result in data) {
          final results = result['results'] as List;
          for (var item in results) {
            items.add(FoodItem.fromJson({
              'title': item['name'] ?? '',
              'calories': extractCalories(item['content'] ?? ''),
              'image': item['image'] ?? '',
              'link': item['link'] ?? '',
              'price': extractPrice(item['content'] ?? ''),
            }));
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

  @action
  void addToCart(FoodItem item) {
    cartItems.add(item);
  }

  @action
  void removeFromCart(FoodItem item) {
    cartItems.remove(item);
  }

  double get totalCartPrice => cartItems.fold(0, (total, item) => total + 2);
}

double extractCalories(String content) {
  final regex = RegExp(r'(\d+) calories');
  final match = regex.firstMatch(content);
  return match != null ? double.parse(match.group(1)!) : 0.0;
}

double extractPrice(String content) {
  final regex = RegExp(r'\$(\d+\.\d+) per serving');
  final match = regex.firstMatch(content);
  return match != null ? double.parse(match.group(1)!) : 0.0;
}