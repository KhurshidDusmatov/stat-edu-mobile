// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTypeResponseData _$PaymentTypeResponseDataFromJson(
        Map<String, dynamic> json) =>
    PaymentTypeResponseData(
      ownership: json['ownership'] as String?,
      grandCount: (json['grandCount'] as num?)?.toInt(),
      contractCount: (json['contractCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentTypeResponseDataToJson(
        PaymentTypeResponseData instance) =>
    <String, dynamic>{
      'ownership': instance.ownership,
      'grandCount': instance.grandCount,
      'contractCount': instance.contractCount,
    };
