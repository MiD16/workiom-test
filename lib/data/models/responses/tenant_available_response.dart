import 'package:json_annotation/json_annotation.dart';
part 'tenant_available_response.g.dart';

@JsonSerializable()
class IsTenantAvailableResponse {
  final dynamic result;

  IsTenantAvailableResponse({required this.result});

  factory IsTenantAvailableResponse.fromJson(Map<String, dynamic> json) =>
      _$IsTenantAvailableResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IsTenantAvailableResponseToJson(this);
}