# gpCheck

<span class="badge badge-secondary">function</span>

```gml
gpCheck(gp, [pressed], [gp_num])
```

## Description
Checks if a gamepad button is pressed or not

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| gp | `gp` | The gamepad button to check for |
| pressed | `bool` | Whether to check as pressed or not (default: false) |
| device | `real` | Gamepad device number (default: 0) |

## Returns
`bool` 

## Example
gpCheck(gp_axislr, true, global.gamepads_connected[0]);