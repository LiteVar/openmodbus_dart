import 'package:json_annotation/json_annotation.dart';
import 'parameter.dart';
import 'path.dart';
import 'return.dart';

part 'function_model.g.dart';

class MethodType {
  static const String READ = "read";
  static const String WRITE = "write";
}

class DataType {
  static const String BOOL = "bool";
  static const String INT16 = "int16";
  static const String INT32 = "int32";
  static const String UINT16 = "uint16";
  static const String UINT32 = "uint32";
  static const String STRING = "string";
}

@JsonSerializable()
class FunctionModel {
  String name;
  String? description;
  String method;
  Path path;
  Parameter? parameter;
  @JsonKey(name: "return")
  Return? return_;

  FunctionModel({
    required this.name,
    this.description,
    required this.method,
    required this.path,
    this.parameter,
    this.return_,
  });

  factory FunctionModel.fromJson(Map<String, dynamic> json) => _$FunctionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionModelToJson(this);
}