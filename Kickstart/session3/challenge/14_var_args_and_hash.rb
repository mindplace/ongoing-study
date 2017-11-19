# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14(end_length=nil, *args)
  options = args.last if args.last.is_a?(Hash)
  if options.nil? || options[:problem] == :count_clumps
    array = args.insert(0, end_length).select{|i| i.is_a?(Fixnum)}
    count_clumps(array)
  else
    same_ends(end_length, args[0...-1])
  end
end

def same_ends(subarray_length, *array)
  array = array.flatten
  if array.length < subarray_length
    return false
  end

  starting_slice = array[0...subarray_length]
  ending_slice = array[(array.length - subarray_length)..-1]
  starting_slice == ending_slice
end

def count_clumps(*array)
  array = array.flatten
  clumps = 0
  i = 1
  currently_on_clump = false
  while i < array.length
    previous = array[i - 1]

    if previous == array[i]
      if !currently_on_clump
        clumps += 1
      end

      currently_on_clump = true
    else
      currently_on_clump = false
    end

    i += 1
  end
  clumps
end
