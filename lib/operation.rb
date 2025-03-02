module Operation
  def matrix_multiply(matrix1, matrix2)
    if matrix1.is_a?(Array) && matrix1.all? { |e| !e.is_a?(Array) } &&
       matrix2.is_a?(Array) && matrix2.all? { |e| !e.is_a?(Array) }

      if matrix1.length != matrix2.length
        raise ArgumentError, "Vectors must have the same length for multiplication"
      end

      steps = matrix1.zip(matrix2).map { |a, b| "#{a} * #{b}" }
      sum = matrix1.zip(matrix2).map { |a, b| a * b }.sum

      return ["#{steps.join(' + ')} = #{sum}"]
    end

    if matrix1[0].length != matrix2.length
      raise ArgumentError, "Matrices cannot be multiplied: incompatible dimensions"
    end

    rows1 = matrix1.length
    cols1 = matrix1[0].length
    cols2 = matrix2[0].length

    result_display = Array.new(rows1) { Array.new(cols2, "") }

    (0...rows1).each do |i|
      (0...cols2).each do |j|
        calc_steps = []
        sum = 0

        (0...cols1).each do |k|
          calc_steps << "#{matrix1[i][k]} * #{matrix2[k][j]}"
          sum += matrix1[i][k] * matrix2[k][j]
        end

        result_display[i][j] = "#{calc_steps.join(' + ')} = #{sum}"
      end
    end

    result_display
  end

  def matrix_add(matrix1, matrix2)
    matrix_elementwise_operation(matrix1, matrix2, :+)
  end

  def matrix_subtract(matrix1, matrix2)
    matrix_elementwise_operation(matrix1, matrix2, :-)
  end

  def matrix_divide(matrix1, matrix2)
    matrix_elementwise_operation(matrix1, matrix2, :/)
  end

  private

  def matrix_elementwise_operation(matrix1, matrix2, operation)
    if matrix1.is_a?(Array) && matrix1.all? { |e| !e.is_a?(Array) } &&
       matrix2.is_a?(Array) && matrix2.all? { |e| !e.is_a?(Array) }

      if matrix1.length != matrix2.length
        raise ArgumentError, "Vectors must have the same length for #{operation}" 
      end

      return matrix1.zip(matrix2).map { |a, b| "#{a} #{operation} #{b} = #{a.send(operation, b)}" }
    end

    if matrix1.length != matrix2.length || matrix1[0].length != matrix2[0].length
      raise ArgumentError, "Matrices must have the same dimensions for #{operation}" 
    end

    rows = matrix1.length
    cols = matrix1[0].length

    result_display = Array.new(rows) { Array.new(cols, "") }

    (0...rows).each do |i|
      (0...cols).each do |j|
        calc_steps = "#{matrix1[i][j]} #{operation} #{matrix2[i][j]}"
        result = matrix1[i][j].send(operation, matrix2[i][j])
        result_display[i][j] = "#{calc_steps} = #{result}"
      end
    end

    result_display
  end
end
