# Write a method that takes an array of integers and returns an array with the array elements multiplied by two.

def multiplied(array)
    array.map{|i| i * 2}.join(", ")
end

puts multiplied([3,2,4,6])
puts multiplied([11,22,33,0])

# Write a method that finds the median of a given array of integers. 
# If the array has an odd number of integers, return the middle item from the sorted array. 
# If the array has an even number of integers, return the average of the middle two items from the sorted array.

def find_median(array)
   count = array.count
   return array[array.length / 2] if count.odd?
   (array[array.length / 2] + array[(array.length / 2) - 1]) / 2
end

puts find_median([2,3,4,6,7,8])
puts find_median([1,2,3,4,5])

# Create a method that takes in an Array of Strings and uses inject to return the concatenation of the strings.

def concatenation(array)
    array.inject{|string, word| string + " " + word }.strip
end

puts concatenation(["A", "happy", "dog"])
puts concatenation(["Wherever", "you", "are", "you're", "not", "here"])