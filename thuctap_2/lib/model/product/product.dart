import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? title,
    String? brand,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
