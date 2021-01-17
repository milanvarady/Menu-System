# drawInput

<span class="badge badge-secondary">function</span>

```gml
drawInput(x, y, input, font, [scale], [col], [replace_col], [txt_scale], [left_origin])
```

## Description
Draws an input to the screen as an icon

## Arguments
| Name | Type | Description |
| ---- | ---- | ----------- |
| x | `real` | Icon x position |
| y | `real` | Icon y position |
| input | `input` | The input to be drawn |
| font | `font` | Text font |
| scale | `real` | Icon scale (default: 1) |
| col | `color` | Icon color theme (default: c_red) |
| replace_col | `color` | The color to be replaced with the theme color (default: $8c0ed) |
| txt_scale | `real` | Text scale (default: 1) |
| left_origin | `bool` | If true sprites will be drawn with the origin on the left (default: false) |