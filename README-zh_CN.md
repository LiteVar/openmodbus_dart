# openmodbus_dart

[English](README.md) · 中文

一个用于 Dart 的 OpenModbus JSON 规范解析器

灵感来源于OpenAPI、OpenRPC和OpenAI的 `function calling`示例。

## 功能

- 加载 OpenTool JSON 文件，并转换为 Dart 对象。 见 [OpenModbus规范](openmodbus-specification-cn.md).

## 用法

根据 `/example/openmodbus_dart_example.dart` 示例进行操作。

- 从 JSON 字符串加载
```dart
Future<void> main() async {
  String jsonString = "{...OpenModbus String...}";
  OpenModbusLoader openModbusLoader = OpenModbusLoader();
  OpenModbus openModbus = await openModbusLoader.load(jsonString);
}
```
- 从 JSON 文件加载
```dart
Future<void> main() async {
  String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
  OpenModbusLoader openModbusLoader = OpenModbusLoader();
  OpenModbus openModbus = await openModbusLoader.loadFromFile(jsonPath); 
}
```