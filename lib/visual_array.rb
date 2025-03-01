# frozen_string_literal: true

require_relative "visual_array/version"

module VisualArray
  class Error < StandardError; end

  class << self
    require 'terminal-table'

    def display(array)
      if !array.is_a?(Array)
        raise Error, "Input must be an array"
      end

      dimensions = array_dimensions(array)

      case dimensions
      when 1
        display_1d(array)
      when 2
        display_2d(array)
      else
        display_multi_d(array)
      end
    end

    private

    def array_dimensions(array)
      return 0 unless array.is_a?(Array)
      1 + array.map { |sub| array_dimensions(sub) }.max.to_i
    end

    def display_1d(array)
      table = Terminal::Table.new do |t|
        t.rows = [array]
      end
      puts table
    end

    def display_2d(array)
      table = Terminal::Table.new(rows: array)
      puts table
    end

    def display_multi_d(array, depth = 0)
      array.each_with_index do |sub_array, index|
        puts "\nDimension #{depth + 1}, Index #{index}:\n"
        display(sub_array)
      end
    end
  end
end
