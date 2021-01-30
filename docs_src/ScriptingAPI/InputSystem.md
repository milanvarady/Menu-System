# InputSystem

<span class="badge badge-secondary">constructor</span>

```gml
new inputSystem(inputs)
```

## Description
This constructor creates a new input system.

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| inputs | `struct` | The inputs in this format {name1: [in1, in2, in3...], name2: [in1, in2, in3...]...} |

## Returns
`struct` The input system

## Methods
| Name | Description |
| ---- | ----------- |
| [check](InputSystem.check.html) | Checks for the inputs. Retrurns a struct of each with a down, and pressed value. (e.g. right: {down: true, pressed: false) |
| [clear](InputSystem.clear.html) | Clears the input struct |
| [describe](InputSystem.describe.html) | Lists the currents inputs to the output window. Good for debugging purposes. |
| [load](InputSystem.load.html) | Loads a saved input file. |
| [save](InputSystem.save.html) | Saves the inputs to a file. |

## Example
```gml
in_sys = new InputSystem({
    right:  [vk_right,  "d", gp_padr, gp_axislr],
    left:   [vk_left,   "a", gp_padl, gp_axisll],
    jump:   [vk_up,     "w", gp_a],
    shoot:  [vk_space,  gp_shoulderrb, gp_x]
});
```