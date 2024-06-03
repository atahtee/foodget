// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodStore on _FoodStore, Store {
  late final _$foodItemsAtom =
      Atom(name: '_FoodStore.foodItems', context: context);

  @override
  ObservableList<FoodItem> get foodItems {
    _$foodItemsAtom.reportRead();
    return super.foodItems;
  }

  @override
  set foodItems(ObservableList<FoodItem> value) {
    _$foodItemsAtom.reportWrite(value, super.foodItems, () {
      super.foodItems = value;
    });
  }

  late final _$fetchFoodItemsAsyncAction =
      AsyncAction('_FoodStore.fetchFoodItems', context: context);

  @override
  Future<void> fetchFoodItems() {
    return _$fetchFoodItemsAsyncAction.run(() => super.fetchFoodItems());
  }

  @override
  String toString() {
    return '''
foodItems: ${foodItems}
    ''';
  }
}
