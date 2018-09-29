# Given an array of elements, return true if any element shows up three times in a row
# 
# Examples:
# got_three? [1, 2, 2, 2, 3]  # => true
# got_three? ['a', 'a', 'b']  # => false
# got_three? ['a', 'a', 'a']  # => true
# got_three? [1, 2, 1, 1]     # => false

def got_three?(array)
  p array
  until array[2].nil?
    p array
    return true if array[0..2].uniq.length == 1
    array.shift(1)
    p array
  end
  false 
end
