# inputCheck

<span class="badge badge-secondary">function</span>

```gml
inputCheck(input/arr, [pressed], [gamepad_device])
```

## Description
Checks one or more inputs of any type, returns true if any of them are pressed.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| input | `input or array` | /arr One input or an array of inputs of any type |
| pressed | `bool` | Whether the input should be checked as pressed or not (default: false) |
| gamepad_device | `real` | Damepad device to check (default: 0) |

## Returns
`bool` 