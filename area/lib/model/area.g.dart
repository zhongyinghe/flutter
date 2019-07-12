// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
      json['code'] as String,
      json['name'] as String,
      (json['children'] as List)
          ?.map((e) =>
              e == null ? null : Area.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'children': instance.children
    };
