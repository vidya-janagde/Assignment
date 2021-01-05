

import 'package:json_annotation/json_annotation.dart';
part 'Status.g.dart';
@JsonSerializable(explicitToJson: true,anyMap: true)
class Status {
  @JsonKey(name: 'isValid', defaultValue: '',ignore: true)
  bool isValid;
  @JsonKey(name: 'message', defaultValue: '',ignore: true)
  String message;

  Status({this.isValid, this.message});


  factory Status.fromJson(Map<String,dynamic>  json) =>_$StatusFromJson(json);

  Map <String,dynamic> toJson() => _$StatusToJson(this);


}