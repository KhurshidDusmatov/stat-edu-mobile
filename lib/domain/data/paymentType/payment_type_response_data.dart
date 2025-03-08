import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_response_data.g.dart';

@JsonSerializable()
class PaymentTypeResponseData {
  String? ownership;
  int? grandCount;
  int? contractCount;

  PaymentTypeResponseData({this.ownership, this.grandCount, this.contractCount});

  factory PaymentTypeResponseData.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeResponseDataToJson(this);
}