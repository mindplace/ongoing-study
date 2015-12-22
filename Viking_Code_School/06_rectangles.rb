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