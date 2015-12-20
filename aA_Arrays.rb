# Two sum:
# Write a method that finds if an array of numbers has a pair that sums to zero. 
# Be careful of the case of zero; there need to be two zeroes in the array to make a pair that sums to zero.

def two_sum(array)
  array_of_nums = array.map {|i| i.abs}
  duplicates = array_of_nums.select {|i| array_of_nums.count(i) > 1}
  return true if duplicates.uniq.length > 0
  false
end

# puts('Array of [0, 0, 2, 3, 4] should return true: ' + (two_sum([0,0,2,3,4]) == true).to_s)
# puts('Array of [22, 0, 44, 3, 1] should return false: ' + (two_sum([22,0,44,3,1]) == false).to_s)
# puts('Array of [22, 22, 55, 55, 11, 11] should return true: ' + (two_sum([22,22,55,55,11,11]) == true).to_s)

# My Unique Array: 

def my_uniq(array)
  returning_array = []
  array.each {|i| returning_array.include?(i) ? next : returning_array << i }
  returning_array.join(", ")
end

# puts my_uniq([2,3,4,5,6])
# puts my_uniq([1,1,4,6,6])
# puts my_uniq([22,55,44,11])

# Towers of Hanoi
# Write a Towers of Hanoi game.
# Keep three arrays, which represents the piles of discs. 
# Pick a representation of the discs to store in the arrays; maybe just a number representing their size.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!
#
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:
#
#rows = [
#    [0, 1, 2],
#    [3, 4, 5],
#    [6, 7, 8]
#  ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
#
# We could equivalently have stored the matrix as an array of columns:
# 
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations.

def my_transpose(rows)
  cols = [
    [rows[0][0], rows[1][0], rows[2][0]],
    [rows[0][1], rows[1][1], rows[2][1]],
    [rows[0][2], rows[1][2], rows[2][2]]
    ]
    cols.each_with_index do |column, i|
      puts "column #{i} is #{column.join(", ")}"
    end
end

my_transpose([[0,1,2], [3,4,5], [6,7,8] ])