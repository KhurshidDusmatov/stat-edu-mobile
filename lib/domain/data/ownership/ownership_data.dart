import 'package:freezed_annotation/freezed_annotation.dart';

part 'ownership_data.g.dart';

@JsonSerializable()
class ResponseData {
  final String name;
  final int count;

  ResponseData({required this.name, required this.count});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}