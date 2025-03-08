// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edu_type_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EduTypeResponseData _$EduTypeResponseDataFromJson(Map<String, dynamic> json) =>
    EduTypeResponseData(
      ownership: json['ownership'] as String?,
      bachelorCount: (json['bachelorCount'] as num?)?.toInt(),
      masterCount: (json['masterCount'] as num?)?.toInt(),
      ordinaturaCount: (json['ordinaturaCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EduTypeResponseDataToJson(
        EduTypeResponseData instance) =>
    <String, dynamic>{
      'ownership': instance.ownership,
      'bachelorCount': instance.bachelorCount,
      'masterCount': instance.masterCount,
      'ordinaturaCount': instance.ordinaturaCount,
    };
