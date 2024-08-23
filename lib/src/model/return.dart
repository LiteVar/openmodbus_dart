import 'package:json_annotation/json_annotation.dart';

part 'return.g.dart';

@JsonSerializable()
class Return {
  String name;
  String? description;
  String type;
  double multiplier;
  String? uom;

  Return({required this.name, this.description, required this.type, this.multiplier = 1, this.uom});

  factory Return.fromJson(Map<String, dynamic> json) => _$ReturnFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnToJson(this);

}