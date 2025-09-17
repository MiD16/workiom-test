import 'package:json_annotation/json_annotation.dart';
part 'authenticate_request.g.dart';

@JsonSerializable()
class AuthenticateRequest {
  final String ianaTimeZone;
  final String password;
  final bool rememberClient;
  final dynamic returnUrl;
  final bool singleSignIn;
  final String? tenantName;
  final String userNameOrEmailAddress;

  AuthenticateRequest({
    required this.ianaTimeZone,
    required this.password,
    this.rememberClient = false,
    this.returnUrl,
    this.singleSignIn = false,
    this.tenantName,
    required this.userNameOrEmailAddress,
  });

  factory AuthenticateRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticateRequestToJson(this);
}