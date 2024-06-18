# openmodbus_dart
An OpenModbus JSON Spec Parser for dart.

Inspired by OpenAPI, OpenRPC, and OpenAI `function calling` example.

## Features

- Load OpenModbus json file, and convert to dart object.

## Usage

According to `/example/openmodbus_dart_example.dart`.

- From JSON String
```dart
Future<void> main() async {
  String jsonString = "{...OpenModbus String...}";
  OpenModbusLoader openModbusLoader = OpenModbusLoader();
  OpenModbus openModbus = await openModbusLoader.load(jsonString);
}
```
- From JSON File
```dart
Future<void> main() async {
  String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
  OpenModbusLoader openModbusLoader = OpenModbusLoader();
  OpenModbus openModbus = await openModbusLoader.loadFromFile(jsonPath); 
}
```