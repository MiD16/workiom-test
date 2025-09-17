import 'package:json_annotation/json_annotation.dart';
part 'authenticate_response.g.dart';

@JsonSerializable()
class AuthenticateResponse {
  final dynamic result;

  AuthenticateResponse({required this.result});

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticateResponseToJson(this);
}