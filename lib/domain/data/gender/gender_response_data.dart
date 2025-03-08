import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_response_data.g.dart';

@JsonSerializable()
class GenderResponseData {
  String? ownership;
  int? maleCount;
  int? femaleCount;

  GenderResponseData({this.ownership, this.maleCount, this.femaleCount});

  factory GenderResponseData.fromJson(Map<String, dynamic> json) =>
      _$GenderResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$GenderResponseDataToJson(this);
}