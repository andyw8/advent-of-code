class InputReader
  BOARD_SIZE = 5
  BOARDS_OFFSET = 2

  def initialize(input)
    @input = input
  end

  def drawn_numbers
    input.lines.first.split(",").map(&method(:Integer))
  end

  def boards
    board_lines
      .reject { _1 == "\n" }
      .map(&:strip)
      .each_slice(BOARD_SIZE)
      .map { |lines_for_board| lines_for_board.map { _1.split(" ").map(&method(:Integer)) } }
      .map { Board.new(_1) }
  end

  private

  attr_reader :input

  def board_lines
    input.lines[BOARDS_OFFSET..]
  end
end

class Board
  def initialize(rows)
    @rows = rows
    @marks = []
  end

  def mark(number)
    @marks << number
  end

  def winner?
    row_win? || column_win?
  end

  def score
    rows.sum do |row|
      row.reject { marks.include?(_1) }.sum
    end
  end

  private

  attr_reader :rows, :marks

  def row_win?
    rows.any? do |row|
      row.all? { |number| marks.include?(number) }
    end
  end

  def column_win?
    rows.transpose.any? do |column|
      column.all? { |number| marks.include?(number) }
    end
  end
end

module GiantSquidBingo
  def self.winning_board_score
    input = File.read("input.txt")
    input_reader = InputReader.new(input)
    boards = input_reader.boards

    input_reader.drawn_numbers.each do |num|
      boards.each do |board|
        board.mark(num)
        if board.winner?
          return board.score * num
        end
      end
    end
  end
end

GiantSquidBingo.winning_board_score # => 82440
