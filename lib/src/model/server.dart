import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

enum ServerType {
  tcp, udp,   // via NetConfig
  rtu, ascii  // via SerialConfig
}

@JsonSerializable(createFactory: false)
class Server {
  late ServerType type;
  late dynamic config;

  Server({required this.type, this.config});

  factory Server.fromJson(Map<String, dynamic> json) {
    dynamic configObj;
    if(json['type'].toString().toLowerCase() == ServerType.tcp.name.toLowerCase() || json['type'].toString().toLowerCase() == ServerType.udp.name.toLowerCase() ) {
      configObj = NetConfig.fromJson(json['config']);
    } else {
      configObj = SerialConfig.fromJson(json['config']);
    }

    return Server(
      type: $enumDecode(_$ServerTypeEnumMap, json['type']),
      config: configObj,
    );
  }

  Map<String, dynamic> toJson() => _$ServerToJson(this);

}

@JsonSerializable()
class NetConfig {
  late String url;
  late int port;

  NetConfig({required this.url, this.port = 502});

  factory NetConfig.fromJson(Map<String, dynamic> json) => _$NetConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NetConfigToJson(this);
}

@JsonSerializable()
class SerialConfig {
  late String port;
  late int baudRate;

  SerialConfig({required this.port, this.baudRate = 9600});

  factory SerialConfig.fromJson(Map<String, dynamic> json) => _$SerialConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SerialConfigToJson(this);
}