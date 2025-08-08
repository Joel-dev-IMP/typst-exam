#let snap_to_cell_size = (target_size, cell_size) => {
  return 1pt * (length.pt(target_size) - calc.rem(length.pt(target_size), length.pt(cell_size)))
}

#let to_length = (value, full_length) => {
  if (type(value) == ratio) {
    return value * full_length
  }

  if (type(value) == relative) {
    return value.ratio * full_length + value.length
  }

  return value
}

#let textbox = (width, height, cell_size, color) => {
  layout(el => {
    let actual_width = to_length(width, el.width)
    let actual_height = to_length(height, el.height)

    let pat = tiling(size: (cell_size, cell_size))[
      #place(line(start: (0%, 0%), end: (100%, 0%), stroke: color))
      #place(line(start: (0%, 0%), end: (0%, 100%), stroke: color))
    ]

    rect(
      fill: pat,
      width: snap_to_cell_size(actual_width, cell_size) + 0.5pt,
      height: snap_to_cell_size(actual_height, cell_size) + 0.5pt,
      stroke: 1pt + color,
    )
  })
}

#let colors = (
  black: rgb("#000000"),
  dark_grey: rgb("#2e2e2e"),
  grey: rgb("#6b6b6b"),
)
