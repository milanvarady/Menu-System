# Shift

<span class="badge badge-secondary">function</span>

```gml
Shift(options, default_val, save_key)
```

## Description
Shifts a value between given options. The settings struct value is ranging from 0 to number of options - 1.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| options | `array` | The list of options with strings (e.g. ["Easy", "Normal", "Hard"]) |
| default_val | `real` | Default value if save file doesn't exists |
| save_key | `string` | The name under the value is being stored in the settings struct |

## Returns
`struct` 

## Example
new Shift(["Easy", "Normal", "Hard"], 1, "difficulty")