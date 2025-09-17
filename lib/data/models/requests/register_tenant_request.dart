import 'package:json_annotation/json_annotation.dart';
part 'register_tenant_request.g.dart';

@JsonSerializable()
class RegisterTenantRequest {
  final String adminEmailAddress;
  final String adminFirstName;
  final String adminLastName;
  final String adminPassword;
  final dynamic captchaResponse;
  final int? editionId;
  final String name;
  final String tenancyName;
  RegisterTenantRequest({
    required this.adminEmailAddress,
    required this.adminFirstName,
    required this.adminLastName,
    required this.adminPassword,
    this.captchaResponse,
    this.editionId,
    required this.name,
    required this.tenancyName,
  });

  factory RegisterTenantRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterTenantRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTenantRequestToJson(this);
}