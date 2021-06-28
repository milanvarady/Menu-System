# check

<span class="badge badge-secondary">function</span>

```gml
check([gamepad_device])
```

## Description
Checks for the inputs. Retrurns a struct of each with a down, pressed, and released value. (e.g. right: {down: true, pressed: false, released: true)

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| gamepad_device | `real` | Gamepad device (default: 0) |

## Returns
`struct` 

## Example
in = in_sys.check();