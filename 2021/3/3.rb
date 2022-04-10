require "pry"
# inputs = <<~EOF
#   00100
#   11110
#   10110
#   10111
#   10101
#   01111
#   00111
#   11100
#   10000
#   11001
#   00010
#   01010
# EOF
inputs = File.read("inputs.txt")
@lines = inputs.split

def gamma_rate
  most_common(position: 0)
end

def epsilon_rate
  most_common(position: 1)
end

def tally(position:)
  @lines
    .map { _1[position] }
    .tally
end

def most_common(position:)
  k, _count = tally(position: position)
    .max_by { |_value, count| count }
  k
end

def least_common(position:)
  k, _ = tally(position: position)
    .min_by { |_value, count| count }
  k
end

gamma_rate = (0...inputs.split.first.chars.count).inject("") do |memo, i|
  memo + most_common(position: i)
end

epsilon_rate = (0...inputs.split.first.chars.count).inject("") do |memo, i|
  memo + least_common(position: i)
end

raise "wrong" unless "0b#{gamma_rate}".to_i(2) * "0b#{epsilon_rate}".to_i(2) == 3959450
