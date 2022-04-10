def count_trees(across_step, down_step)
  grid =File
    .read('input')
    .split
    .map(&:chars)

  width = grid.first.size
  height = grid.size

  count = 0
  col = 0
  (1...height).step(down_step).each do |line|
    col += across_step
    col -= width if col >= width
    count += 1 if grid.fetch(line).fetch(col) == '#'
  end

  raise 'n' unless count
  count
end

slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

puts "y"
puts(slopes.map do |(a, b)|
  x = count_trees(b, a)
end.inject(&:*))

