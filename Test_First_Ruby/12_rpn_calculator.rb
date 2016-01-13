class RPNCalculator
  attr_accessor :calculator
  
  def initialize
    @stack = []
    @value = 0
  end
  
  def push(number)
    @stack << number
  end
  
  def plus
    raise "calculator is empty" if @stack[-2..-1] == nil
    @value = @stack[-2..-1].inject(:+)
    @stack[-2..-1] = @value
  end
  
  def minus
    raise "calculator is empty" if @stack[-2..-1] == nil
    @value = @stack[-2..-1].inject(:-)
    @stack[-2..-1] = @value
  end
  
  def divide
    raise "calculator is empty" if @stack[-2..-1] == nil
    items = @stack[-2..-1]
    @value = items[0].to_f / items[1].to_f
    @stack[-2..-1] = @value
  end
  
  def times
    raise "calculator is empty" if @stack[-2..-1] == nil
    @value = @stack[-2..-1].inject(:*)
    @stack[-2..-1] = @value
  end
  
  def value
    @value
  end
  
  def tokens(string)
    string_stack = string.split
    string_stack.map{|x| x.to_i == 0 ? x.to_sym : x.to_i}
  end
  
  def update_stack(symbol)
    if symbol == :+
      plus
    elsif symbol == :-
      minus
    elsif symbol == :*
      times
    else
      divide
    end
  end
  
  def evaluate(string)
    string_stack = tokens(string)
    updating_stack = string_stack
    while string_stack.length != 1
      string_stack.each_index do |i|
        symbol = string_stack[i]
        first_num = string_stack[i - 2]
        second_num = string_stack[i - 1]
        next unless symbol.is_a?(Symbol)
        @stack << first_num.to_i
        @stack << second_num.to_i
        update_stack(symbol)
        symbol_index = updating_stack.index(symbol)
        updating_stack[symbol_index - 2..symbol_index] = @value
        
        if i = string_stack.length - 1
          string_stack = updating_stack
        end
      end
    end
    string_stack[0]
  end
end


