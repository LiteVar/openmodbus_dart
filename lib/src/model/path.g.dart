// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Path _$PathFromJson(Map<String, dynamic> json) => Path(
      slaveId: (json['slaveId'] as num).toInt(),
      storage: $enumDecode(_$StorageTypeEnumMap, json['storage']),
      address: (json['address'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'slaveId': instance.slaveId,
      'storage': _$StorageTypeEnumMap[instance.storage]!,
      'address': instance.address,
      'count': instance.count,
    };

const _$StorageTypeEnumMap = {
  StorageType.coils: 'coils',
  StorageType.discreteInput: 'discreteInput',
  StorageType.inputRegisters: 'inputRegisters',
  StorageType.holdingRegisters: 'holdingRegisters',
};
