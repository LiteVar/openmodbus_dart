import 'package:openmodbus_dart/openmodbus_dart.dart';

import 'dart:io';

void main() async {
  String folder = "${Directory.current.path}${Platform.pathSeparator}example${Platform.pathSeparator}json";
  List<String> jsonFileNameList = ["ascii-safe-system-example.json", "rtu-lights-example.json", "tcp-air-condition-example.json"];

  jsonFileNameList.forEach((jsonFileName) async {
    print("FILE_NAME: $jsonFileName");
    String jsonPath = "$folder${Platform.pathSeparator}$jsonFileName";
    OpenModbusLoader openModbusLoader = OpenModbusLoader();
    OpenModbus openModbus = await openModbusLoader.loadFromFile(jsonPath);
    print("title: ${openModbus.info.title}");
  });
}
