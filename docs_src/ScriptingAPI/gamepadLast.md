# gamepadLast

<span class="badge badge-secondary">function</span>

```gml
gamepadLast(device, [pressed])
```

## Description
Gets last gamepad button that was pressed, similar to keyboard_key

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| device | `real` | Gamepad device to check |
| pressed | `bool` | Whether the input should be checked as pressed or not (default: false) |

## Returns
`input` 

## Example
gamepadLast(0, false);