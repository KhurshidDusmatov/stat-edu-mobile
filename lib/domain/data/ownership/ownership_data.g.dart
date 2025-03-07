// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownership_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnershipData _$OwnershipDataFromJson(Map<String, dynamic> json) =>
    OwnershipData(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$OwnershipDataToJson(OwnershipData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };
