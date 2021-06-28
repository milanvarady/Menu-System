# gamepadLast

<span class="badge badge-secondary">function</span>

```gml
gamepadLast(device, [mode])
```

## Description
Gets last gamepad button that was pressed, similar to keyboard_key

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| device | `real` | Gamepad device to check |
| mode | `enum` | Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN) |

## Returns
`input` 

## Example
gamepadLast(0, false);