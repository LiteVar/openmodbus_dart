// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Return _$ReturnFromJson(Map<String, dynamic> json) => Return(
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      multiplier: (json['multiplier'] as num?)?.toDouble() ?? 1,
      uom: json['uom'] as String?,
    );

Map<String, dynamic> _$ReturnToJson(Return instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'multiplier': instance.multiplier,
      'uom': instance.uom,
    };
