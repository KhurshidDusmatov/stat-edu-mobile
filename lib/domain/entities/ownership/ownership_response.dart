import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rttrm_task_app/domain/data/ownership/ownership_data.dart';

part 'ownership_response.g.dart';

@JsonSerializable()
class OwnershipResponse {
  final String name;
  final int count;

  OwnershipResponse({ required  this.name,required  this.count});

  factory OwnershipResponse.fromJson(Map<String, dynamic> json) =>
      _$OwnershipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OwnershipResponseToJson(this);
}
