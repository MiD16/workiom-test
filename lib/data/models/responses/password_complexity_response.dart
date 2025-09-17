import 'package:json_annotation/json_annotation.dart';
part 'password_complexity_response.g.dart';

@JsonSerializable()
class PasswordComplexityResponse {
  final dynamic result;

  PasswordComplexityResponse({required this.result});

  factory PasswordComplexityResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordComplexityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordComplexityResponseToJson(this);
}