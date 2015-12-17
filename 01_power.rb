# Write a method power which takes two integers (base and exponent) 
# and returns the base raised to the power of exponent. 
# Do not use Ruby’s ** operator for this!

def power(base, exponent)
    result = 1
    exponent.times {result *= base}
    result
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

