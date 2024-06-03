import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/food_item.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [IsarFoodItemSchema],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addFoodItems(List<FoodItem> items) async {
    final isar = await db;
    final isarItems = items.map((item) => IsarFoodItem()
      ..title = item.title
      ..calories = item.calories
      ..image = item.image
      ..link = item.link
      ..price = item.price).toList();
    await isar.writeTxn(() async {
      await isar.isarFoodItems.putAll(isarItems);
    });
  }

  Future<List<FoodItem>> getFoodItems() async {
    final isar = await db;
    final isarItems = await isar.isarFoodItems.where().findAll();
    return isarItems.map((isarItem) => FoodItem(
      id: isarItem.id,
      title: isarItem.title,
      calories: isarItem.calories,
      image: isarItem.image,
      link: isarItem.link,
      price: isarItem.price,
    )).toList();
  }

  Future<bool> isFoodItemsEmpty() async {
    final isar = await db;
    return await isar.isarFoodItems.count() == 0;
  }
}