# OpenModbus规范

版本 1.0.0

## 介绍

OpenModbus规范（OMS）定义了Modbus工具调用的标准、语言无关的接口描述，允许人类和计算机发现和理解Modbus服务的功能，而无需访问源代码和文档。如果定义正确，消费者只需使用最少的实现逻辑即可理解和使用支持Modbus的工具。

### 参考

OpenModbus规范参考了[OpenTool](https://github.com/LiteVar/opentool_dart/blob/main/opentool-specification-cn.md)规范，更新了针对Modbus协议的部分。

### 目标

OpenModbus面向Modbus协议的程序调用描述，并且配合[OpenModbusDriver](https://github.com/LiteVar/opentool_dart/blob/main/lib/src/driver/modbus/openmodbus_driver.dart)使用，达到用户描述函数，可以驱动具体工具执行函数调用

与OpenTool一致，这将很方便地用于：
1. 大语言模型的`Function Calling`，根据描述，驱动具体工具完成函数调用；
2. 工作流描述调用，结合`OpenWorkflow`描述，可以批量驱动工具完成函数调用。
    - 这对于让大语言模型生成`OpenWorkflow`文本，可以达到按时序驱动工具函数调用的效果。适合于需要按固定顺序调用函数的场景。

## 对象

### OpenModbus对象

| 字段         | 类型             | 描述                            |
|------------|----------------|-------------------------------|
| openmodbus | `string`       | **必填**。当前OpenModbus的JSON文档版本。 |
| info       | Info对象         | **必填**。描述当前OpenModbus文档的信息。   |
| server     | Server对象       | **必填**。描述当前OpenModbus设备的访问信息。 |
| functions  | \[Function对象\] | **必填**。描述当前工具调用支持的函数信息。       |

### Info对象

| 字段          | 类型       | 描述                           |
|-------------|----------|------------------------------|
| title       | `string` | **必填**。当前OpenTool的JSON文档的标题。 |
| description | `string` | 当前OpenTool文档的更详细的描述信息。       |
| version     | `string` | **必填**。当前文档的版本号，用于文档版本管理。    |

### Server对象

| 字段     | 类型                        | 描述                                     |
|--------|---------------------------|----------------------------------------|
| type   | `string`                  | **必填**。可选包括`tcp` `udp` `rtu` `ascii` 。 |
| config | NetConfig \| SerialConfig | 根据不同的type，传入不同的配置。                     |

#### NetConfig 对象：当`type`为`tcp` `udp`时
| 字段   | 类型        | 描述                            |
|------|-----------|-------------------------------|
| url  | `string`  | **必填**。网络Modbus设备的域名或IP。      |
| port | `integer` | **必填**。网络Modbus设备的端口，例如`502`。 |

#### SerialConfig 对象：当`type`为`rtu` `ascii`时
| 字段       | 类型        | 描述                                |
|----------|-----------|-----------------------------------|
| port     | `string`  | **必填**。串口Modbus设备的识别名，例如`COM3`。   |
| baudRate | `integer` | **必填**。串口Modbus设备的通信波特率，例如`9600`。 |

### Function对象

| 字段          | 类型          | 描述                                                         |
|-------------|-------------|------------------------------------------------------------|
| name        | `string`    | **必填**。为兼容`OpenTool`，函数的名称，只包含a-z、A-Z、0-9、-、_符号，且不超过64个字符。 |
| description | `string`    | 函数的描述，用于解释当前function的作用。                                   |
| method      | `string`    | 函数的读写类型，可选包括`read` `write`。                                |
| parameter   | Parameter对象 | 函数的传入参数的描述，如果`method`为`write`，则此项必填。                       |
| return      | Return对象    | 函数返回参数的描述。如果`method`为`read`，则此项必填。                         |

### Parameter对象

| 字段          | 类型       | 描述                                                                                |
|-------------|----------|-----------------------------------------------------------------------------------|
| name        | `string` | **必填**。参数的名称。                                                                     |
| description | `string` | 参数的描述，用于解释当前参数的作用。                                                                |
| type        | `string` | **必填**。可选包括`bool` `int16` `int32` `uint16` `uint32` `string`。                     |
| multiplier  | `double` | **必填**。数值的倍数，默认为`1`；例如：返回`uint16`为`328`，`multiplier`为`0.1`，`uom`为`℃`，则可表示`32.8℃`。 |
| uom         | `stirng` | 参数的单位，例如：`℃`、`kg`                                                                 |

### Return对象

| 字段          | 类型       | 描述                                                                                |
|-------------|----------|-----------------------------------------------------------------------------------|
| name        | `string` | **必填**。返回值的名称。                                                                    |
| description | `string` | 返回值的描述，用于解释当前参数的作用。                                                               |
| type        | `string` | **必填**。可选包括`bool` `int16` `int32` `uint16` `uint32` `string`。                     |
| multiplier  | `double` | **必填**。数值的倍数，默认为`1`；例如：返回`uint16`为`328`，`multiplier`为`0.1`，`uom`为`℃`，则可表示`32.8℃`。 |
| uom         | `stirng` | 参数的单位，例如：`℃`、`kg`                                                                 |
