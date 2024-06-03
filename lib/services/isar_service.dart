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
        [FoodItemSchema],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addFoodItems(List<FoodItem> items) async {
    final isar = await db;
    isar.writeTxn(() => isar.foodItems.putAll(items));
  }

  Future<List<FoodItem>> getFoodItems() async {
    final isar = await db;
    return await isar.foodItems.where().findAll();
  }

  Future<bool> isFoodItemsEmpty() async {
    final isar = await db;
    return await isar.foodItems.count() == 0;
  }
}
