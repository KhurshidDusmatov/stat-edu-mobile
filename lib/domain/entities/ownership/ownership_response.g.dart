// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownership_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnershipResponse _$OwnershipResponseFromJson(Map<String, dynamic> json) =>
    OwnershipResponse(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$OwnershipResponseToJson(OwnershipResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };
