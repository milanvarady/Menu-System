# Controls

<span class="badge badge-secondary">function</span>

```gml
Controls(input_system, [order])
```

## Description
Automatically creates a controls menu based on an input system

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| input_system | `struct` | The input system used |
| filename | `string` | Save file name, or false if you don't want to save the inputs. (default: false) |
| reset_on | `bool` | Whether to make a reset defaults option for the controls or not (default: false) |
| order | `array` | (optional) Order of inputs, because structs doesn't save their elements in order (e.g. ["right", "left", "jump") |

## Returns
`struct` 

## Example
new Controls(global.player_input_system, "input_save.json", ["right", "left", "jump"])