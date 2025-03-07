import 'package:freezed_annotation/freezed_annotation.dart';

part 'ownership_data.g.dart';

@JsonSerializable()
class OwnershipData {
  final String name;
  final int count;

  OwnershipData({required this.name, required this.count});

  factory OwnershipData.fromJson(Map<String, dynamic> json) =>
      _$OwnershipDataFromJson(json);

  Map<String, dynamic> toJson() => _$OwnershipDataToJson(this);
}