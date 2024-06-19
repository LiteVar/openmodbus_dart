// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
      'type': _$ServerTypeEnumMap[instance.type]!,
      'config': instance.config,
    };

const _$ServerTypeEnumMap = {
  ServerType.tcp: 'tcp',
  ServerType.udp: 'udp',
  ServerType.rtu: 'rtu',
  ServerType.ascii: 'ascii',
};

NetConfig _$NetConfigFromJson(Map<String, dynamic> json) => NetConfig(
      url: json['url'] as String,
      port: (json['port'] as num?)?.toInt() ?? 502,
    );

Map<String, dynamic> _$NetConfigToJson(NetConfig instance) => <String, dynamic>{
      'url': instance.url,
      'port': instance.port,
    };

SerialConfig _$SerialConfigFromJson(Map<String, dynamic> json) => SerialConfig(
      port: json['port'] as String,
      baudRate: (json['baudRate'] as num?)?.toInt() ?? 9600,
    );

Map<String, dynamic> _$SerialConfigToJson(SerialConfig instance) =>
    <String, dynamic>{
      'port': instance.port,
      'baudRate': instance.baudRate,
    };
