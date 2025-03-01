require 'rspec'
require 'terminal-table'
require 'rainbow'
require_relative '../lib/visual_array'

def strip_ansi_codes(text)
  text.gsub(/\e\[\d+m/, '')
end

def capture_stdout
  require 'stringio'
  original_stdout = $stdout
  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = original_stdout
end

describe VisualArray do
  describe ".display" do
    context "when input is not an array" do
      it "raises an error" do
        expect { VisualArray.display("not an array") }.to raise_error(VisualArray::Error, "Input must be an array")
      end
    end

    context "when input is a 1D array" do
      it "displays a table with indices and values" do
        array = [1, 2, 3]
        output = capture_stdout { VisualArray.display(array) }
        expect(strip_ansi_codes(output)).to match(/Index.*Value/)
      end
    end

    context "when input is a 2D array" do
      it "displays a table with row and column indices" do
        array = [[1, 2], [3, 4]]
        output = capture_stdout { VisualArray.display(array) }
        expect(strip_ansi_codes(output)).to match(/\|\s+\|\s+Col 0\s+\|\s+Col 1\s+\|/)  
      end
    end

    context "when input is a 3D array" do
      it "displays multiple dimensions correctly" do
        array = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
        output = capture_stdout { VisualArray.display(array) }
        expect(strip_ansi_codes(output)).to match(/Dimension 1, Index 0:/)
      end
    end
  end
end
