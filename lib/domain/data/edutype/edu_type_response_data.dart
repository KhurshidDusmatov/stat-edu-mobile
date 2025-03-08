import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_type_response_data.g.dart';

@JsonSerializable()
class EduTypeResponseData {
  String? ownership;
  int? bachelorCount;
  int? masterCount;
  int? ordinaturaCount;

  EduTypeResponseData(
      {this.ownership,
        this.bachelorCount,
        this.masterCount,
        this.ordinaturaCount});

  factory EduTypeResponseData.fromJson(Map<String, dynamic> json) =>
      _$EduTypeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$EduTypeResponseDataToJson(this);
}