# gpCheck

<span class="badge badge-secondary">function</span>

```gml
gpCheck(gp, [mode], [gp_num])
```

## Description
Checks if a gamepad button is pressed or not

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| gp | `gp` | The gamepad button to check for |
| mode | `enum` | Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN) |
| device | `real` | Gamepad device number (default: 0) |

## Returns
`bool` 

## Example
gpCheck(gp_axislr, CHECK_MODE.PRESSED, global.gamepads_connected[0]);