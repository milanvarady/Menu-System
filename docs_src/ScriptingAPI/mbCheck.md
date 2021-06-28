# mbCheck

<span class="badge badge-secondary">function</span>

```gml
mbCheck(mouse_button, [mode])
```

## Description
Checks if a mouse button is pressed or not

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| mouse_button | `mb` | Mouse button to check for |
| mode | `enum` | Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN) |

## Returns
`bool` 

## Example
mbCheck(mb_left, CHECK_MODE.PRESSED);