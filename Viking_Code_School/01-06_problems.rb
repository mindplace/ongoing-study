# 1. Write a method power which takes two integers (base and exponent) 
# and returns the base raised to the power of exponent. 
# Do not use Ruby’s ** operator for this!

def power(base, exponent)
    result = 1
    exponent.times {result *= base}
    result
end

# 2. Write a method factorial which takes a number and returns the 
# product of every number up to the current number multiplied together.

def factorial(num)
    (1..num).to_a.inject(:*)
end

# 3. Write a method uniques which takes an array of items and returns the array 
# without any duplicates. Don’t use Ruby’s uniq method!

def uniques(array)
    returning = []
    array = array.map{|i| i.to_s}.sort
    array.each_with_index do |item, index| 
        if index == 0
            returning << item
        else 
            returning << item if item != array[index - 1]
        end
    end
    "[#{returning.join(", ")}]"
end

# 4. Write a method combinations which takes two arrays of strings and 
# returns an array with all of the combinations of the items in them, 
# listing the first items first.

def combinations(first, second)
    combined = []
    first.each do |part_one| 
        second.each do |part_two|
            combined << part_one + part_two
        end
    end
    "[#{combined.join(",")}]"
end

# 5. Write a method is_prime? which takes in a number and returns true 
# if it is a prime number.

def is_prime?(num)
    (2..num).to_a.select{|i| num % i == 0} == [num]
end

# Write a method overlap which takes two rectangles defined by the coordinates 
# of their corners, e.g. [[0,0],[3,3]] and [[1,1],[4,6]], and determines whether 
# they overlap. You can assume all coordinates are positive integers.
# 
# > overlap( [ [0,0],[3,3] ], [ [1,1],[4,5] ] )
# => true
# > overlap( [ [0,0],[1,4] ], [ [1,1],[3,2] ] )
# => false
# It doesn't count as overlapping if their edges touch but they do not 
# otherwise overwrite each other.

def rectangles(first, second)
    x_min = [first[0][0], second[0][0]].max
    x_max = [first[1][0], second[1][0]].min
    y_min = [first[0][1], second[0][1]].max
    y_max = [first[1][1], second[1][1]].min
    
    if ((x_max <= x_min) || (y_max <= y_min))
        false
    else true
    end
end