@aim = 0
@horizontal = 0
@depth = 0

def process_step(movement, magnitude)
  case movement
  when "forward"
    @horizontal += magnitude
    @depth += (@aim * magnitude)
  when "down"
    @aim += magnitude
  when "up"
    @aim -= magnitude
  end
end

File
  .read("inputs.txt")
  .split("\n")
  .map { _1.split(" ") }
  .map { [_1, Integer(_2)]}
  .each { process_step(_1, _2) }

@horizontal * @depth # => 1050
