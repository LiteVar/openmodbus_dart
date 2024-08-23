# OpenModbus Specification

Version 1.0.0

## Introduction

The OpenModbus Specification (OMS) defines the standards and language-independent interface descriptions for Modbus tool invocation. It allows humans and computers to discover and understand the functionality of Modbus services without needing access to source code or documentation. If properly defined, consumers can understand and use tools that support Modbus with minimal implementation logic.

### Reference

The OpenModbus Specification references the [OpenTool](https://github.com/LiteVar/opentool_dart/blob/main/opentool-specification-en.md) Specification and updates parts related to the Modbus protocol.

### Objective

OpenModbus is aimed at describing programmatic invocations for the Modbus protocol and is designed to be used in conjunction with [OpenModbusDriver](https://github.com/LiteVar/opentool_dart/blob/main/lib/src/driver/modbus/openmodbus_driver.dart). This allows users to describe functions that can drive specific tools to execute function calls.

Similar to OpenTool, this can be conveniently used for:
1. Large language models' `Function Calling`, driving specific tools to complete function calls based on descriptions;
2. Workflow description calls, which, when combined with `OpenWorkflow` descriptions, can batch-drive tools to complete function calls.
   - This is useful for scenarios where large language models generate `OpenWorkflow` text to achieve time-sequenced tool function invocation. It is suitable for situations where functions need to be called in a fixed order.

## Objects

### OpenModbus Object

| Field      | Type                | Description                                                                     |
|------------|---------------------|---------------------------------------------------------------------------------|
| openmodbus | `string`            | **Required**. The version of the current OpenModbus JSON document.              |
| info       | Info Object         | **Required**. Describes information about the current OpenModbus document.      |
| server     | Server Object       | **Required**. Describes the access information for the current Modbus device.   |
| functions  | \[Function Object\] | **Required**. Describes the functions supported by the current tool invocation. |

### Info Object

| Field       | Type     | Description                                                                                     |
|-------------|----------|-------------------------------------------------------------------------------------------------|
| title       | `string` | **Required**. The title of the current OpenTool JSON document.                                  |
| description | `string` | A more detailed description of the current OpenTool document.                                   |
| version     | `string` | **Required**. The version number of the current document, used for document version management. |

### Server Object

| Field  | Type                      | Description                                                 |
|--------|---------------------------|-------------------------------------------------------------|
| type   | `string`                  | **Required**. Options include `tcp`, `udp`, `rtu`, `ascii`. |
| config | NetConfig \| SerialConfig | Different configurations are passed depending on the type.  |

#### NetConfig Object: When `type` is `tcp` or `udp`
| Field | Type      | Description                                                         |
|-------|-----------|---------------------------------------------------------------------|
| url   | `string`  | **Required**. The domain name or IP of the network Modbus device.   |
| port  | `integer` | **Required**. The port of the network Modbus device, such as `502`. |

#### SerialConfig Object: When `type` is `rtu` or `ascii`
| Field    | Type      | Description                                                                |
|----------|-----------|----------------------------------------------------------------------------|
| port     | `string`  | **Required**. The identifier for the serial Modbus device, such as `COM3`. |
| baudRate | `integer` | **Required**. The baud rate for the serial Modbus device, such as `9600`.  |

### Function Object

| Field       | Type             | Description                                                                                                                                  |
|-------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| name        | `string`         | **Required**. For compatibility with `OpenTool`, the function name only includes a-z, A-Z, 0-9, `-`, `_`, and does not exceed 64 characters. |
| description | `string`         | A description of the function, explaining its purpose.                                                                                       |
| method      | `string`         | The function's read/write type, options include `read`, `write`.                                                                             |
| parameter   | Parameter Object | A description of the function's input parameters; required if `method` is `write`.                                                           |
| return      | Return Object    | A description of the function's return parameters; required if `method` is `read`.                                                           |

### Parameter Object

| Field       | Type     | Description                                                                                                                                                             |
|-------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name        | `string` | **Required**. The name of the parameter.                                                                                                                                |
| description | `string` | A description of the parameter, explaining its purpose.                                                                                                                 |
| type        | `string` | **Required**. Options include `bool`, `int16`, `int32`, `uint16`, `uint32`, `string`.                                                                                   |
| multiplier  | `double` | **Required**. The multiplier for the value, default is `1`; e.g., if the returned `uint16` is `328`, `multiplier` is `0.1`, and `uom` is `℃`, it can represent `32.8℃`. |
| uom         | `string` | The unit of measure for the parameter, e.g., `℃`, `kg`.                                                                                                                 |

### Return Object

| Field       | Type     | Description                                                                                                                                                             |
|-------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name        | `string` | **Required**. The name of the return value.                                                                                                                             |
| description | `string` | A description of the return value, explaining its purpose.                                                                                                              |
| type        | `string` | **Required**. Options include `bool`, `int16`, `int32`, `uint16`, `uint32`, `string`.                                                                                   |
| multiplier  | `double` | **Required**. The multiplier for the value, default is `1`; e.g., if the returned `uint16` is `328`, `multiplier` is `0.1`, and `uom` is `℃`, it can represent `32.8℃`. |
| uom         | `string` | The unit of measure for the return value, e.g., `℃`, `kg`.                                                                                                              |
