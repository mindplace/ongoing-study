class RPNCalculator
  def initialize
      @stack = []
  end
  
  def push(item)
      @stack << item
  end
  
  def plus
    if @stack.length >= 2 
      @stack << @stack.pop + @stack.pop 
    else raise "calculator is empty"
    end
  end
  
  def minus
    if @stack.length >= 2 
      second_num = @stack.pop
      @stack << @stack.pop - second_num
    else raise "calculator is empty"
    end
  end
  
  def times
    if @stack.length >= 2 
      @stack << @stack.pop * @stack.pop  
    else raise "calculator is empty"
    end
  end
  
  def divide
    if @stack.length >= 2 
      denominator = @stack.pop.to_f
      @stack << @stack.pop.to_f / denominator
    else raise "calculator is empty"
    end
  end
  
  def value
    @stack.last
  end
  
  def evaluate(string)
    tokens(string).each do |item|
      if item == :+
        self.plus
        elsif item == :-
        self.minus
        elsif item == :*
        self.times
        elsif item == :/
        self.divide
      else self.push(item) if item.is_a?(Fixnum)
      end
    end
    self.value
  end
  
  def tokens(string)
    string.split(" ").map{|item| item.to_i != 0 ? item.to_i : item.to_sym}
  end
  
end
