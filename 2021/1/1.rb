inputs = File.read("input.txt")

inputs
  .split
  .map { Integer(_1) }
  .each_cons(2)
  .count { _2 > _1 } # => 1374
