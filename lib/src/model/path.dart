import 'package:json_annotation/json_annotation.dart';

part 'path.g.dart';

/*
Coils 线圈: 开关量，可读可写
DiscreteInputs 输入离散量: 开关量，只读
InputRegisters 输入寄存器: 双byte寄存器，只读
HoldingRegisters 保持寄存器: 双byte寄存器，可读可写
 */
enum StorageType {
  coils,
  discreteInput,
  inputRegisters,
  holdingRegisters
}

@JsonSerializable()
class Path {
  int slaveId;
  StorageType storage;
  int address;
  int count;

  Path({
    required this.slaveId,
    required this.storage,
    required this.address,
    required this.count
  });

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  Map<String, dynamic> toJson() => _$PathToJson(this);
}