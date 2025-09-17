import 'package:json_annotation/json_annotation.dart';
part 'current_login_info_response.g.dart';

@JsonSerializable()
class CurrentLoginInfoResponse {
  final dynamic result;

  CurrentLoginInfoResponse({required this.result});

  factory CurrentLoginInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentLoginInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentLoginInfoResponseToJson(this);
}