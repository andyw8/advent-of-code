grid =File
  .read('input')
  .split
  .map(&:chars)

width = grid.first.size
height = grid.size

ACROSS_STEP = 3
DOWN_STEP = 1

count = 0
col = 0
(1...height).step(DOWN_STEP).each do |line|
  col += ACROSS_STEP
  col -= width if col >= width
  count += 1 if grid.fetch(line).fetch(col) == '#'
end

puts count
