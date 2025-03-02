require 'terminal-table'
require 'rainbow'
require_relative 'operation'

module VisualArray
  class Error < StandardError; end

  class << self
    include Operation
    DEFAULT_COLOR = "green".freeze

    def display(array, color: DEFAULT_COLOR)
      raise Error, "Input must be an array" unless array.is_a?(Array)

      color ||= DEFAULT_COLOR 
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

    def multiply_and_display(matrix1, matrix2, color: DEFAULT_COLOR)
      result_display = matrix_multiply(matrix1, matrix2)

      puts Rainbow("\nMatrix Multiplication Result:\n").magenta.bright
      display(result_display, color: color)
    end

    def add_and_display(matrix1, matrix2, color: DEFAULT_COLOR)
      result_display = matrix_add(matrix1, matrix2)
      puts Rainbow("\nMatrix Addition Result:\n").blue.bright
      display(result_display, color: color)
    end

    def subtract_and_display(matrix1, matrix2, color: DEFAULT_COLOR)
      result_display = matrix_subtract(matrix1, matrix2)
      puts Rainbow("\nMatrix Subtraction Result:\n").red.bright
      display(result_display, color: color)
    end
  
    def divide_and_display(matrix1, matrix2, color: DEFAULT_COLOR)
      result_display = matrix_divide(matrix1, matrix2)
      puts Rainbow("\nMatrix Division Result:\n").yellow.bright
      display(result_display, color: color)
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
