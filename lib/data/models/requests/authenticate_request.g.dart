// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateRequest _$AuthenticateRequestFromJson(Map<String, dynamic> json) =>
    AuthenticateRequest(
      ianaTimeZone: json['ianaTimeZone'] as String,
      password: json['password'] as String,
      rememberClient: json['rememberClient'] as bool? ?? false,
      returnUrl: json['returnUrl'],
      singleSignIn: json['singleSignIn'] as bool? ?? false,
      tenantName: json['tenantName'] as String?,
      userNameOrEmailAddress: json['userNameOrEmailAddress'] as String,
    );

Map<String, dynamic> _$AuthenticateRequestToJson(
  AuthenticateRequest instance,
) => <String, dynamic>{
  'ianaTimeZone': instance.ianaTimeZone,
  'password': instance.password,
  'rememberClient': instance.rememberClient,
  'returnUrl': instance.returnUrl,
  'singleSignIn': instance.singleSignIn,
  'tenantName': instance.tenantName,
  'userNameOrEmailAddress': instance.userNameOrEmailAddress,
};
