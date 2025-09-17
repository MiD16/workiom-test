import 'package:json_annotation/json_annotation.dart';
part 'editions_response.g.dart';

@JsonSerializable()
class EditionsForSelectResponse {
  final dynamic result;

  EditionsForSelectResponse({required this.result});

  factory EditionsForSelectResponse.fromJson(Map<String, dynamic> json) =>
      _$EditionsForSelectResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EditionsForSelectResponseToJson(this);
}