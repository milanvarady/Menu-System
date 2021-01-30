# getGpInputSubtype

<span class="badge badge-secondary">function</span>

```gml
getGpInputSubtype
```

## Description
Returns the sub type of the gamepad input, which can be e_gp_input_subtype.button, dpad, axis, trigger, bumper and start. The enum can be found in the function.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| input | `input` | The input to get the type |

## Returns
`enum` 

## Example
getGpInputSubtype(gamepadLast());