// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      name: json['name'] as String,
      description: json['description'] as String?,
      type: $enumDecode(_$DataTypeEnumMap, json['type']),
      multiplier: (json['multiplier'] as num?)?.toDouble() ?? 1,
      uom: json['uom'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': _$DataTypeEnumMap[instance.type]!,
      'multiplier': instance.multiplier,
      'uom': instance.uom,
    };

const _$DataTypeEnumMap = {
  DataType.bool: 'bool',
  DataType.int16: 'int16',
  DataType.int32: 'int32',
  DataType.uint16: 'uint16',
  DataType.uint32: 'uint32',
  DataType.string: 'string',
};
