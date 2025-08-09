#let checkbox = (
  content,
  checked: false,
  square_size: 10pt,
  stroke_size: 1.5pt,
  stroke_color: black,
  fill_ratio: 70%,
) => {
  let pattern_max = fill_ratio + ((100% - fill_ratio) / 2)
  let pattern_min = ((100% - fill_ratio) / 2)

  let cross_pattern = tiling(size: (square_size, square_size))[
    #place(line(start: (pattern_min, pattern_max), end: (pattern_max, pattern_min), stroke: stroke_color))
    #place(line(start: (pattern_min, pattern_min), end: (pattern_max, pattern_max), stroke: stroke_color))
  ]

  let pattern = none

  if (checked) {
    pattern = cross_pattern
  }

  grid(
    columns: 2,
    rows: 1,
    gutter: 5pt,
    align: horizon,

    box(square(size: square_size, fill: pattern, stroke: stroke_color + stroke_size)), content,
  )
}
