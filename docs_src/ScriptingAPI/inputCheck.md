# inputCheck

<span class="badge badge-secondary">function</span>

```gml
inputCheck(input/arr, [mode], [gamepad_device])
```

## Description
Checks one or more inputs of any type, returns true if any of them are pressed.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| input | `input/array` | /arr One input or an array of inputs of any type |
| mode | `enum` | Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN) |
| gamepad_device | `real` | Damepad device to check (default: 0) |

## Returns
`bool` 

## Example
inputCheck([vk_right, "d", gp_axislr, gp_padr], CHECK_MODE.PRESSED, global.gamepads_connected[0]);