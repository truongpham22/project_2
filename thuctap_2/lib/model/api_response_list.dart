import 'package:json_annotation/json_annotation.dart';

part 'api_response_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponseList<T> {
  @JsonKey(name: 'products')
  List<T>? products;

  @JsonKey(name: 'total')
  int? total;

  APIResponseList({this.products, this.total});

  factory APIResponseList.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      return _$APIResponseListFromJson(json, fromJsonT);
    } catch (e) {
      return APIResponseList();
    }
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$APIResponseListToJson(this, toJsonT);
}
