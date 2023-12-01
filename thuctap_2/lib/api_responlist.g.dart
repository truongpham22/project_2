// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_responlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseList<T> _$APIResponseListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    APIResponseList<T>(
      products: (json['products'] as List<dynamic>?)?.map(fromJsonT).toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$APIResponseListToJson<T>(
  APIResponseList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'products': instance.products?.map(toJsonT).toList(),
      'total': instance.total,
    };
