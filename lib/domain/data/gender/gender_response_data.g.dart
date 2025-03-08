// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenderResponseData _$GenderResponseDataFromJson(Map<String, dynamic> json) =>
    GenderResponseData(
      ownership: json['ownership'] as String?,
      maleCount: (json['maleCount'] as num?)?.toInt(),
      femaleCount: (json['femaleCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GenderResponseDataToJson(GenderResponseData instance) =>
    <String, dynamic>{
      'ownership': instance.ownership,
      'maleCount': instance.maleCount,
      'femaleCount': instance.femaleCount,
    };
