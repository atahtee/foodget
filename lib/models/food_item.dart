import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    @Default(Isar.autoIncrement) int? id,
    required String title,
    required int? calories,
    required String image,
    required String link,
    required double? price,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);
}

@Collection()
class IsarFoodItem {
  Id? id = Isar.autoIncrement;
  late String title;
  late int? calories;
  late String image;
  late String link;
  late double? price;
}