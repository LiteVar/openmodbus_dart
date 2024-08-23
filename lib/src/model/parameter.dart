import 'package:json_annotation/json_annotation.dart';

part 'parameter.g.dart';

@JsonSerializable()
class Parameter {
  String name;
  String? description;
  String type;
  double multiplier;
  String? uom;

  Parameter({required this.name, this.description, required this.type, this.multiplier = 1, this.uom});

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}