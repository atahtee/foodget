import 'package:isar/isar.dart';

part 'food_item.g.dart';

@Collection()
class FoodItem {
  Id id = Isar.autoIncrement;

  late String title;
  late int calories;
}
