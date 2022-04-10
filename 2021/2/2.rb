@horizontal = 0
@depth = 0

def process_step(movement, magnitude)
  case movement
  when "forward"
    @horizontal += magnitude
  when "down"
    @depth += magnitude
  when "up"
    @depth -= magnitude
  end
end

File
  .read("inputs.txt")
  .split("\n")
  .map { _1.split(" ") }
  .map { [_1, Integer(_2)]}
  .each { process_step(_1, _2) }

@horizontal * @depth # => 2039912
