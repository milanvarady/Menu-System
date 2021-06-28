# keyCheck

<span class="badge badge-secondary">function</span>

```gml
keyCheck(key, [mode])
```

## Description
Checks if a key is pressed or not

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| key | `vk/string` | The key to be checked. ord() is not accepted only vk and string (e.g. vk_left, "a", "1") |
| mode | `enum` | Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN) |

## Returns
`bool` 

## Example
keyCheck(vk_right, CHECK_MODE.PRESSED);