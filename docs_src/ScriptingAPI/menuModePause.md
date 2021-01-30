# menuModePause

<span class="badge badge-secondary">function</span>

```gml
menuModePause([preset], [room])
```

## Description
This function will set the menu into pause screen mode. Which means that the menu will be disabled and pausing enabled.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| preset | `real` | (optional) The preset to change to |
| room | `real` | (optional) Room to go to |

## Returns
`undefined` N/A

## Example
menuModePause(e_menu_presets.pause_menu, rGame);