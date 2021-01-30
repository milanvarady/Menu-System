# inputLast

<span class="badge badge-secondary">function</span>

```gml
inputLast()
```

## Description
Returns the last input pressed of any type: keyboard, mouse, gamepad. Or undefined if no input is pressed.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| gamepad_device | `None` | The gamepad to check (default: 0) |

## Returns
`input/undefined` 

## Example
inputLast(global.gamepads_connected[0]);