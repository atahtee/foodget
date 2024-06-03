// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodItemData _$FoodItemDataFromJson(Map<String, dynamic> json) {
  return _FoodItemData.fromJson(json);
}

/// @nodoc
mixin _$FoodItemData {
  String get title => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemDataCopyWith<FoodItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemDataCopyWith<$Res> {
  factory $FoodItemDataCopyWith(
          FoodItemData value, $Res Function(FoodItemData) then) =
      _$FoodItemDataCopyWithImpl<$Res, FoodItemData>;
  @useResult
  $Res call(
      {String title, int calories, String image, String link, double price});
}

/// @nodoc
class _$FoodItemDataCopyWithImpl<$Res, $Val extends FoodItemData>
    implements $FoodItemDataCopyWith<$Res> {
  _$FoodItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? calories = null,
    Object? image = null,
    Object? link = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodItemDataImplCopyWith<$Res>
    implements $FoodItemDataCopyWith<$Res> {
  factory _$$FoodItemDataImplCopyWith(
          _$FoodItemDataImpl value, $Res Function(_$FoodItemDataImpl) then) =
      __$$FoodItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, int calories, String image, String link, double price});
}

/// @nodoc
class __$$FoodItemDataImplCopyWithImpl<$Res>
    extends _$FoodItemDataCopyWithImpl<$Res, _$FoodItemDataImpl>
    implements _$$FoodItemDataImplCopyWith<$Res> {
  __$$FoodItemDataImplCopyWithImpl(
      _$FoodItemDataImpl _value, $Res Function(_$FoodItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? calories = null,
    Object? image = null,
    Object? link = null,
    Object? price = null,
  }) {
    return _then(_$FoodItemDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodItemDataImpl implements _FoodItemData {
  const _$FoodItemDataImpl(
      {required this.title,
      required this.calories,
      required this.image,
      required this.link,
      required this.price});

  factory _$FoodItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodItemDataImplFromJson(json);

  @override
  final String title;
  @override
  final int calories;
  @override
  final String image;
  @override
  final String link;
  @override
  final double price;

  @override
  String toString() {
    return 'FoodItemData(title: $title, calories: $calories, image: $image, link: $link, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodItemDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, calories, image, link, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodItemDataImplCopyWith<_$FoodItemDataImpl> get copyWith =>
      __$$FoodItemDataImplCopyWithImpl<_$FoodItemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodItemDataImplToJson(
      this,
    );
  }
}

abstract class _FoodItemData implements FoodItemData {
  const factory _FoodItemData(
      {required final String title,
      required final int calories,
      required final String image,
      required final String link,
      required final double price}) = _$FoodItemDataImpl;

  factory _FoodItemData.fromJson(Map<String, dynamic> json) =
      _$FoodItemDataImpl.fromJson;

  @override
  String get title;
  @override
  int get calories;
  @override
  String get image;
  @override
  String get link;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$FoodItemDataImplCopyWith<_$FoodItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
