inputs = File.read("input.txt")

# Part 1

puts inputs
  .split("\n\n")
  .map {
       _1
         .split("\n")
         .map(&:to_i)
         .sum
     }
  .max

# Part 2

puts inputs
  .split("\n\n")
  .map {
       _1
         .split("\n")
         .map(&:to_i)
         .sum
     }
  .max(3).sum
