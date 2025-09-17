import 'package:json_annotation/json_annotation.dart';
part 'is_tenant_available_request.g.dart';

@JsonSerializable()
class IsTenantAvailableRequest {
  final String tenancyName;

  IsTenantAvailableRequest({required this.tenancyName});

  factory IsTenantAvailableRequest.fromJson(Map<String, dynamic> json) =>
      _$IsTenantAvailableRequestFromJson(json);
  Map<String, dynamic> toJson() => _$IsTenantAvailableRequestToJson(this);
}