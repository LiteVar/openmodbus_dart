// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionModel _$FunctionModelFromJson(Map<String, dynamic> json) =>
    FunctionModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      method: json['method'] as String,
      path: Path.fromJson(json['path'] as Map<String, dynamic>),
      parameter: json['parameter'] == null
          ? null
          : Parameter.fromJson(json['parameter'] as Map<String, dynamic>),
      return_: json['return'] == null
          ? null
          : Return.fromJson(json['return'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FunctionModelToJson(FunctionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'method': instance.method,
      'path': instance.path,
      'parameter': instance.parameter,
      'return': instance.return_,
    };
