require 'terminal-table'
require 'rainbow'

module VisualArray
  class Error < StandardError; end

  class << self
    def display(array, color: "green")
      raise Error, "Input must be an array" unless array.is_a?(Array)

      dimensions = array_dimensions(array)

      case dimensions
      when 1
        display_1d(array, color)
      when 2
        display_2d(array, color)
      else
        display_multi_d(array, color)
      end
    end

    private

    def array_dimensions(array)
      return 0 unless array.is_a?(Array)
      1 + array.map { |sub| array_dimensions(sub) }.max.to_i
    end

    def display_1d(array, color)
      table = Terminal::Table.new do |t|
        t.headings = [Rainbow("Index").cyan, Rainbow("Value").yellow]
        array.each_with_index { |val, i| t.add_row([i, Rainbow(val).send(color)]) }
      end
      puts table
    end

    def display_2d(array, color)
      table = Terminal::Table.new do |t|
        column_headers = [" "] + (0...array.first.size).map { |i| Rainbow("Col #{i}").cyan }
        t.add_row(column_headers)
        t.add_separator
        array.each_with_index do |row, i|
          t.add_row([Rainbow("Row #{i}").yellow] + row.map { |val| Rainbow(val).send(color) })
        end
      end
      puts table
    end

    def display_multi_d(array, color, depth = 0)
      array.each_with_index do |sub_array, index|
        puts Rainbow("\nDimension #{depth + 1}, Index #{index}:\n").magenta.bright
        display(sub_array, color: color)
      end
    end
  end
end
