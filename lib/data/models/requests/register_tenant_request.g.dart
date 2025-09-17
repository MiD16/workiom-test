// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_tenant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTenantRequest _$RegisterTenantRequestFromJson(
  Map<String, dynamic> json,
) => RegisterTenantRequest(
  adminEmailAddress: json['adminEmailAddress'] as String,
  adminFirstName: json['adminFirstName'] as String,
  adminLastName: json['adminLastName'] as String,
  adminPassword: json['adminPassword'] as String,
  captchaResponse: json['captchaResponse'],
  editionId: (json['editionId'] as num?)?.toInt(),
  name: json['name'] as String,
  tenancyName: json['tenancyName'] as String,
);

Map<String, dynamic> _$RegisterTenantRequestToJson(
  RegisterTenantRequest instance,
) => <String, dynamic>{
  'adminEmailAddress': instance.adminEmailAddress,
  'adminFirstName': instance.adminFirstName,
  'adminLastName': instance.adminLastName,
  'adminPassword': instance.adminPassword,
  'captchaResponse': instance.captchaResponse,
  'editionId': instance.editionId,
  'name': instance.name,
  'tenancyName': instance.tenancyName,
};
