// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parameter _$ParameterFromJson(Map<String, dynamic> json) => Parameter(
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      multiplier: (json['multiplier'] as num?)?.toDouble() ?? 1,
      uom: json['uom'] as String?,
    );

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'multiplier': instance.multiplier,
      'uom': instance.uom,
    };
