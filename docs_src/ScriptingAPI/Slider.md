# Slider

<span class="badge badge-secondary">function</span>

```gml
Slider(range_array, default_val, save_key)
```

## Description
Changes a value in a range slider

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| range_array | `array` | The values range like this: [min_val, max_val] |
| default_val | `real` | Default value if save file doesn't exists |
| save_key | `string` | The name under the value is being stored in the settings struct |

## Returns
`struct` 

## Example
new Slider([0, 1], 0.3, "volume_master")