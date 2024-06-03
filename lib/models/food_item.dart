import 'package:isar/isar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@Collection()
class FoodItem {
  Id id = Isar.autoIncrement;

  late String title;
  late int calories;
  late String image;
  late String link;
  late double price;  // Add price field
}

@freezed
class FoodItemData with _$FoodItemData {
  const factory FoodItemData({
    required String title,
    required int calories,
    required String image,
    required String link,
    required double price,  // Add price field
  }) = _FoodItemData;

  factory FoodItemData.fromJson(Map<String, dynamic> json) => _$FoodItemDataFromJson(json);
}
